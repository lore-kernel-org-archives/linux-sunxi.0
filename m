Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6028249E
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714404019; cv=none; b=ag49HvxgeFAhgAs69MdId3Ls+NqLoG25k5Bs0DFklW9I9+lvp66l+yAMSeC0vj9ZLUu9r4b8A/LbTOBtsgbkpUX6LdmPCqAepNhdEL1VjxIw9klXVJaCh8ux+G8EKLJ3rPz7CHQJkw8iNVY+Q4OKKWwVYeM9aD3uq3+t+uhvYHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714404019; c=relaxed/simple;
	bh=GNdq7quKix1GhDkO/nl+wtPP19OpIPRbiguVR/qjUAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J2Fa98qM5A3PYmOaxCsnR8JYCdpflhJ3rYciQwJZ17mgyqasya7xBZZIGZTVjhmAdeweFC4KGbQijx5kjFCyD3zdmOp2YL6g0UGy32ZXDvZubO5t6JOYNnWRHP2Foqzmgpd7JpRD3o8rjWltrJ9xevjjP1nExbj+xpBEyxQpfU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKEhz4x7; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKEhz4x7"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a524ecaf215so581959366b.2
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Apr 2024 08:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714404016; x=1715008816; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xestw1QNtEj/9cyE5NFVKambADQI6O/71HDnKGCInV8=;
        b=RKEhz4x7lZD65JmK+MB25eNGQXFUNjDLX/Nk/MS4a54Hof5UNtI+JdrTjt+qaHa/3G
         LvdJLBHs8Hc/i0sJqbnGDVakAIM9fp7sGEE7bblbqCLrQ5T6K0/DyvacH+5SFZEZtQ6X
         yC1YO98lebusl5c1wYiaOZG3x/gOzVS6YaLwLI7Opn5gmKC5UqyUc5z3n6gOLCYRelWl
         oCBCJ55UAXwuo737rmQZUFsPUd+b8ZJOv3dCSd8KIb8KVPeb4ps6uv3g9f73HBDnY26w
         yyb1WiR8H2fCQluRomuX5zVCFgBtZikpkwQ772ZAd4JCxxZjRS2zTBANJH5BKzxI1bjm
         6dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714404016; x=1715008816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xestw1QNtEj/9cyE5NFVKambADQI6O/71HDnKGCInV8=;
        b=FIDjSbRVrs7zI9YxEv2Sq9Jbgxjte9dDNUoqksLQnwG2OEaKrr2KyOMLAZkexR0aOQ
         RLjgUx7HyNNLfMvKl+mjoBQspztdvFP5JcA1nu+EMbiUCPhr6flnLcIyS3GlG5pvDa2j
         9viOOqwK7Is4hcMByp5Yye83IJYq0DXni2K3mK5AxtuhQpPEM44ZIPZijhNbLHAHHxxI
         31VEEurdJSMU3f8m1oBRLByXO1sxR5qM5FfKrOtWIuqnHAiCgCGSRTm5HGV4Shw5hQbD
         MbWZ5JU9DRKZgL/8ni0eoxCrkXUXe13WEuWE2ka9RM8r+E7k82lBqchL9ac6FCGhFzMs
         iruw==
X-Forwarded-Encrypted: i=1; AJvYcCWZYbCvE6TSelxpqSqT/jIQPzdPJ0uIj7FVhiLjWa8h5RXvs8+yy2clFLaWtGW+MlGx8PgvQ63DXLEUV4S5TBz8Y+ng0dMfDrLSafg=
X-Gm-Message-State: AOJu0YxeUuFHqePpdju8I7LabF/tWFSzoS/pzq7pRXrpQSBR54fNRdO3
	zuAxV1/tNT41WNXtXpa58pEVddrd11FHOmZ0qRWVyfOX5nK4ZpxQ
X-Google-Smtp-Source: AGHT+IFv2yQ+ISFsWoxWBWHT/F9qtbk97DzSDaqfb1LCDyJmZc2vAJwQngftmAeom2YpKJaF4blgng==
X-Received: by 2002:a17:906:f9d6:b0:a58:f186:192 with SMTP id lj22-20020a170906f9d600b00a58f1860192mr3955858ejb.0.1714404016298;
        Mon, 29 Apr 2024 08:20:16 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906500800b00a4e24d259edsm13916302ejj.167.2024.04.29.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:20:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-spi@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH 7/8] spi: sun6i: use 'time_left' variable with
 wait_for_completion_timeout()
Date: Mon, 29 Apr 2024 17:20:14 +0200
Message-ID: <4885599.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20240429112843.67628-8-wsa+renesas@sang-engineering.com>
References:
 <20240429112843.67628-1-wsa+renesas@sang-engineering.com>
 <20240429112843.67628-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 29. april 2024 ob 13:28:40 GMT +2 je Wolfram Sang napisal(a):
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

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/spi/spi-sun6i.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
> index cd018ea1abf1..7bbe7ea0d66a 100644
> --- a/drivers/spi/spi-sun6i.c
> +++ b/drivers/spi/spi-sun6i.c
> @@ -277,7 +277,8 @@ static int sun6i_spi_transfer_one(struct spi_controller *host,
>  				  struct spi_transfer *tfr)
>  {
>  	struct sun6i_spi *sspi = spi_controller_get_devdata(host);
> -	unsigned int div, div_cdr1, div_cdr2, timeout;
> +	unsigned int div, div_cdr1, div_cdr2;
> +	unsigned long time_left;
>  	unsigned int start, end, tx_time;
>  	unsigned int trig_level;
>  	unsigned int tx_len = 0, rx_len = 0, nbits = 0;
> @@ -488,26 +489,26 @@ static int sun6i_spi_transfer_one(struct spi_controller *host,
>  
>  	tx_time = spi_controller_xfer_timeout(host, tfr);
>  	start = jiffies;
> -	timeout = wait_for_completion_timeout(&sspi->done,
> -					      msecs_to_jiffies(tx_time));
> +	time_left = wait_for_completion_timeout(&sspi->done,
> +						msecs_to_jiffies(tx_time));
>  
>  	if (!use_dma) {
>  		sun6i_spi_drain_fifo(sspi);
>  	} else {
> -		if (timeout && rx_len) {
> +		if (time_left && rx_len) {
>  			/*
>  			 * Even though RX on the peripheral side has finished
>  			 * RX DMA might still be in flight
>  			 */
> -			timeout = wait_for_completion_timeout(&sspi->dma_rx_done,
> -							      timeout);
> -			if (!timeout)
> +			time_left = wait_for_completion_timeout(&sspi->dma_rx_done,
> +							      time_left);
> +			if (!time_left)
>  				dev_warn(&host->dev, "RX DMA timeout\n");
>  		}
>  	}
>  
>  	end = jiffies;
> -	if (!timeout) {
> +	if (!time_left) {
>  		dev_warn(&host->dev,
>  			 "%s: timeout transferring %u bytes@%iHz for %i(%i)ms",
>  			 dev_name(&spi->dev), tfr->len, tfr->speed_hz,
> 




