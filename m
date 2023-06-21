Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EAD18C2E
	for <linux-sunxi@lists.linux.dev>; Wed, 21 Jun 2023 15:51:44 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30fcda210cfso6018460f8f.3
        for <linux-sunxi@lists.linux.dev>; Wed, 21 Jun 2023 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687362703; x=1689954703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aC81hT2eRQBjkojJrQa9BM2dAGgpSMK2LXGRglIV5hw=;
        b=mqi7fm69G1L7cEB/FeYvXqf9QyhMh1oLHnDcNBlWVNoFnHegIYS+R+ecL+9SrnZdoJ
         omi7ZPmVm0NSXZXd2auduGsejwdcEGoF/3dwrmt9sc6SsMg0NEE0ef13Ov+KzxwA9cE3
         BIEYV/3eYIwoyofzhRYjkFpf7O/MjWlLsiEvBmpbdHRIHqUAS9PCe8IkwS8BkAz9+zaj
         ofXKscB/utGxvaGcm56qkL4yZUuTvE+JH827SzSlEKJTJbxtWWXbtcETz6PjMmg8gUSQ
         qGdzas3bkJeJR+DE/gBkYgcvmL5zQc6lpOeveBlRORqlxAnRrFfzonuo6PMlT1VpdLuJ
         ByNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687362703; x=1689954703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aC81hT2eRQBjkojJrQa9BM2dAGgpSMK2LXGRglIV5hw=;
        b=XYWpUjzXW12h4NS/qpNqSTvs8xbeqQkTQ2+G006GIjWT048GmnDAeqSPfoA2j5A/t1
         WGimo6CtyHtzuHCtpJG7kNBIVHHvYcbNrbHBGCxSO2MVWmFTIIYh5skaaJoagYYaA12Y
         uzIKeRAsriYBfJUXbboPyB6E4rS0Z2ODs/Kv1CG4NPIiBs/ZPplLUJh5kmIqWHz1y0qp
         b+WRvK3JCcV3d0KXteqCEjpR2/RqO60Mzs8+dl/peOORuEoE/Rhw1H0TJoU8VHkezwu6
         xeXuNxkUCiUOt2vuItaSP9o7jBCPeTAtzD3YTYXuXMcTSUN2sewzlKulflWMyvQoSI6A
         89PA==
X-Gm-Message-State: AC+VfDwj5x3tpOOjM7Mc/oqp9C1T/ysEesH253tN5fdcrP3BOsRHEzAG
	30GaQUffRwYykb9WXwjmR5A=
X-Google-Smtp-Source: ACHHUZ6mfiuUSKUL9T4FG0zO9eFCzfqn7gdQJ+UxFybrS+0IlVlSOIzIttkP0rZOt+iRNg6rGhm6KQ==
X-Received: by 2002:a5d:4bc1:0:b0:311:b8d:a63b with SMTP id l1-20020a5d4bc1000000b003110b8da63bmr11474994wrt.15.1687362702797;
        Wed, 21 Jun 2023 08:51:42 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id x1-20020a5d4441000000b00311d8c2561bsm4795824wrr.60.2023.06.21.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 08:51:42 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Miquel Raynal <miquel.raynal@bootlin.com>
Subject:
 Re: [PATCH v2 3/3] spi: sun6i: Use the new helper to derive the xfer timeout
 value
Date: Wed, 21 Jun 2023 17:51:40 +0200
Message-ID: <5683683.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230619155349.3118420-4-miquel.raynal@bootlin.com>
References:
 <20230619155349.3118420-1-miquel.raynal@bootlin.com>
 <20230619155349.3118420-4-miquel.raynal@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 19. junij 2023 ob 17:53:49 CEST je Miquel Raynal napisal(a):
> A helper was recently added to the core to factorize common code between
> drivers, like the amount of time a driver should wait for a transfer to
> happen.
> 
> It is of course possible to use a default value (like eg. 1s) but it is
> way stronger to adapt this amount of time to the transfer. Indeed, long
> transfers (eg. 4MiB) on a slow single-spi bus might take more than the
> usual second of timeout and prevent lengthy transfers.
> 
> The core helper was heavily inspired by the logic applied in this
> driver, the only difference being the minimum amount of time which was
> enlarged from 0.1s to 0.5s.
> 
> Use this helper instead of open-coding it.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/spi/spi-sun6i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
> index 23ad052528db..180094dfae19 100644
> --- a/drivers/spi/spi-sun6i.c
> +++ b/drivers/spi/spi-sun6i.c
> @@ -422,7 +422,7 @@ static int sun6i_spi_transfer_one(struct spi_master *master,
>  	reg = sun6i_spi_read(sspi, SUN6I_TFR_CTL_REG);
>  	sun6i_spi_write(sspi, SUN6I_TFR_CTL_REG, reg | SUN6I_TFR_CTL_XCH);
>  
> -	tx_time = max(tfr->len * 8 * 2 / (tfr->speed_hz / 1000), 100U);
> +	tx_time = spi_controller_xfer_timeout(master, tfr);
>  	start = jiffies;
>  	timeout = wait_for_completion_timeout(&sspi->done,
>  					      msecs_to_jiffies(tx_time));
> 




