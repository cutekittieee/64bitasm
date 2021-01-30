int main(void)
{
	long data = 0L;
	int sum = 0;
	int i = 0;
	while(i<64)
	{
		sum += data & 1;
		data = data >> 1;
		i++;
	}
	return 0;
}
