from django.core.management.base import BaseCommand
from website.models import Record


class Command(BaseCommand):
    help = 'Create sample records for the CRM'

    def handle(self, *args, **options):
        # Check if records already exist
        if Record.objects.count() > 0:
            self.stdout.write(
                self.style.SUCCESS(
                    f'Sample data already exists ({Record.objects.count()} records found)'
                )
            )
            return

        # Create sample records
        sample_records = [
            {
                'first_name': 'John',
                'last_name': 'Doe',
                'email': 'john.doe@example.com',
                'phone': '555-0101',
                'address': '123 Main St',
                'city': 'New York',
                'state': 'NY',
                'zipcode': '10001'
            },
            {
                'first_name': 'Jane',
                'last_name': 'Smith',
                'email': 'jane.smith@example.com',
                'phone': '555-0102',
                'address': '456 Oak Ave',
                'city': 'Los Angeles',
                'state': 'CA',
                'zipcode': '90210'
            },
            {
                'first_name': 'Bob',
                'last_name': 'Johnson',
                'email': 'bob.johnson@example.com',
                'phone': '555-0103',
                'address': '789 Pine St',
                'city': 'Chicago',
                'state': 'IL',
                'zipcode': '60601'
            },
            {
                'first_name': 'Alice',
                'last_name': 'Williams',
                'email': 'alice.williams@example.com',
                'phone': '555-0104',
                'address': '321 Elm Dr',
                'city': 'Houston',
                'state': 'TX',
                'zipcode': '77001'
            },
            {
                'first_name': 'Charlie',
                'last_name': 'Brown',
                'email': 'charlie.brown@example.com',
                'phone': '555-0105',
                'address': '654 Maple Ln',
                'city': 'Phoenix',
                'state': 'AZ',
                'zipcode': '85001'
            }
        ]

        for record_data in sample_records:
            Record.objects.create(**record_data)

        self.stdout.write(
            self.style.SUCCESS(
                f'Successfully created {len(sample_records)} sample records'
            )
        )
