Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184C75338D
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714392885; cv=none; b=RDXlQYE+2B0TwvY7vuPhG7Fh2BUUCieOnRfHeoClsM9GnJd7ZW3kGPsMEC942WF4yjt/sgVbPin+yyn4vQO5+DSkdg7PI/it129riiFS/WxiSm86KsFstVmXo3JCBNxeU7MMWFD20e40khKVPjcPGkxBICHHrJSIaQkf73fqNXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714392885; c=relaxed/simple;
	bh=TY0BbP/ydR9gp4nj26TsMUiKKoe0SHMu2mZIdj/+l9c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H7RYTJW/+3spPHppammUFja7Cn218/Otyp5vbbWrJ3tPjMmjdMQxtUA5+ER4BryZmMNW0dcWC+hLMUEw3wPtigaTZG1DyRQsFqEPu/PMIOACjZfvV9UiVrBLm7n4qbOGyHU1uzMrxoAmxrjgpi545X7s+HvO3im7WCKITE8qKFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D8602F4;
	Mon, 29 Apr 2024 05:15:09 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61A223F73F;
	Mon, 29 Apr 2024 05:14:41 -0700 (PDT)
Date: Mon, 29 Apr 2024 13:14:38 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] spi: sun4i: use 'time_left' variable with
 wait_for_completion_timeout()
Message-ID: <20240429131438.1f036341@donnerap.manchester.arm.com>
In-Reply-To: <20240429112843.67628-7-wsa+renesas@sang-engineering.com>
References: <20240429112843.67628-1-wsa+renesas@sang-engineering.com>
	<20240429112843.67628-7-wsa+renesas@sang-engineering.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Apr 2024 13:28:39 +0200
Wolfram Sang <wsa+renesas@sang-engineering.com> wrote:

> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/spi/spi-sun4i.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/spi/spi-sun4i.c b/drivers/spi/spi-sun4i.c
> index 11d8bd27b3e9..2ee6755b43f5 100644
> --- a/drivers/spi/spi-sun4i.c
> +++ b/drivers/spi/spi-sun4i.c
> @@ -206,7 +206,8 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
>  				  struct spi_transfer *tfr)
>  {
>  	struct sun4i_spi *sspi = spi_controller_get_devdata(host);
> -	unsigned int mclk_rate, div, timeout;
> +	unsigned int mclk_rate, div;
> +	unsigned long time_left;
>  	unsigned int start, end, tx_time;
>  	unsigned int tx_len = 0;
>  	int ret = 0;
> @@ -327,10 +328,10 @@ static int sun4i_spi_transfer_one(struct spi_controller *host,
>  
>  	tx_time = max(tfr->len * 8 * 2 / (tfr->speed_hz / 1000), 100U);
>  	start = jiffies;
> -	timeout = wait_for_completion_timeout(&sspi->done,
> -					      msecs_to_jiffies(tx_time));
> +	time_left = wait_for_completion_timeout(&sspi->done,
> +						msecs_to_jiffies(tx_time));
>  	end = jiffies;
> -	if (!timeout) {
> +	if (!time_left) {
>  		dev_warn(&host->dev,
>  			 "%s: timeout transferring %u bytes@%iHz for %i(%i)ms",
>  			 dev_name(&spi->dev), tfr->len, tfr->speed_hz,

