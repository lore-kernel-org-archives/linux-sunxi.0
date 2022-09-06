Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A467686E9
	for <linux-sunxi@lists.linux.dev>; Tue,  6 Sep 2022 19:52:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id gh9so3763877ejc.8
        for <linux-sunxi@lists.linux.dev>; Tue, 06 Sep 2022 12:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1VmPA5Yq8eTH/6a8GLeRpEEPUlpUiovS+eHf396Ag4g=;
        b=fAEZWrlW3WNegmJlRFl5z4yJJNGBDMHOlL8r6C0EeIaNM/067+srYLvfeOAtwtihYf
         3UxoQg6Lw4seebei0SaHQnYlb947cZAXMTcplsL63gt0t2KsN7OGNCmh6HXh0xHMAOwS
         vLEB4QJhnmMdFnAJfVxE/h0yXpyjffrmM+LGKA+vhIm7kwA0GHIA7GdMIOBVFH9wzkUq
         j+SXUxSv9QsiOuy5eRxsFuJEuxsVJkjQq9AQPlqYxUhEpfLWD29XFbFQSot7nyySSg0Z
         slO2S8jGDSFLx7yGuwV6ZaLoihH3bq4KGOaglNRJLR8/GnJdZMmum0vTmDHwSqVjwlA8
         HAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1VmPA5Yq8eTH/6a8GLeRpEEPUlpUiovS+eHf396Ag4g=;
        b=UoYAfgvpCkZHb+ncDEGSO50f8r53/GRJ43YS0QKB+wULT4e0wwbbnQwyOQ3lue6+V/
         TsULYVT+65OGvhlHZnIiTVlddiMFx5cKnIxpHiqD5TIaH6fZo32Wgeg+5j248WlqJZrS
         lE+z85fHfhx5atKWGpOnJePyhCCJKgZaR996uqBTF781M7F6g5UaNfVznjwRRkXKS7Nb
         ouvIyOoAeVmmXSYNqsT+6H+A8iFIkcHtOA/gpYYOQ2gf1MzdaPT1Q2JAFpShxIpW9rvv
         rKMTgpbV/I3MhCltyiqPK3S4cU6WLitiOxp69OA8rMIsXz+R6LNLNC3sixSeTbsb50yc
         hZZw==
X-Gm-Message-State: ACgBeo19xYf+Tk+iVVojh/vIU0uCfoBmBWuRPNsplV38agzCoHW+xaxi
	I9Lvs4toz2FQ3AZvqhXKV7Z54fkwjCIVWQ==
X-Google-Smtp-Source: AA6agR6l9+2gcUu/mhmRnnWa80cHCNMhpaeUYeFi2zZRQMHUqum76qUrEMPtgl3MaTjDFRyJM6+y3Q==
X-Received: by 2002:a17:907:97c1:b0:741:a098:1703 with SMTP id js1-20020a17090797c100b00741a0981703mr74480ejc.216.1662493946813;
        Tue, 06 Sep 2022 12:52:26 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id r9-20020a1709061ba900b0073dd99a0febsm7115788ejg.188.2022.09.06.12.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 12:52:25 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, qianfanguijin@163.com
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Evgeny Boger <boger@wirenboard.com>, qianfan Zhao <qianfanguijin@163.com>
Subject: Re: [PATCH 1/2] drivers: net: mdio-sun4i: Speedup mdio read and write
Date: Tue, 06 Sep 2022 21:52:24 +0200
Message-ID: <4737709.GXAFRqVoOG@kista>
In-Reply-To: <20220906075616.21347-1-qianfanguijin@163.com>
References: <20220906075616.21347-1-qianfanguijin@163.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 06. september 2022 ob 09:56:15 CEST je qianfanguijin@163.com 
napisal(a):
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> msleep(1) on my board takes about 30ms, and it is too long to accept.
> Use read_poll_timeout to speedup.
> 
> Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
> ---
>  drivers/net/mdio/mdio-sun4i.c | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-sun4i.c b/drivers/net/mdio/mdio-sun4i.c
> index f798de3276dc..168e2a375535 100644
> --- a/drivers/net/mdio/mdio-sun4i.c
> +++ b/drivers/net/mdio/mdio-sun4i.c
> @@ -26,8 +26,6 @@
>  #define EMAC_MAC_MIND_REG	(0x10)
>  #define EMAC_MAC_SSRR_REG	(0x14)
> 
> -#define MDIO_TIMEOUT		(msecs_to_jiffies(100))
> -
>  struct sun4i_mdio_data {
>  	void __iomem		*membase;
>  	struct regulator	*regulator;
> @@ -36,8 +34,7 @@ struct sun4i_mdio_data {
>  static int sun4i_mdio_read(struct mii_bus *bus, int mii_id, int regnum)
>  {
>  	struct sun4i_mdio_data *data = bus->priv;
> -	unsigned long timeout_jiffies;
> -	int value;
> +	int ret, tmp, value;
> 
>  	/* issue the phy address and reg */
>  	writel((mii_id << 8) | regnum, data->membase + EMAC_MAC_MADR_REG);
> @@ -45,12 +42,11 @@ static int sun4i_mdio_read(struct mii_bus *bus, int
> mii_id, int regnum) writel(0x1, data->membase + EMAC_MAC_MCMD_REG);
> 
>  	/* Wait read complete */
> -	timeout_jiffies = jiffies + MDIO_TIMEOUT;
> -	while (readl(data->membase + EMAC_MAC_MIND_REG) & 0x1) {
> -		if (time_is_before_jiffies(timeout_jiffies))
> -			return -ETIMEDOUT;
> -		msleep(1);
> -	}
> +	ret = read_poll_timeout(readl, tmp, (tmp & 1) == 0,
> +				20, 10000, false,
> +				data->membase + 
EMAC_MAC_MIND_REG);

You should use readl_poll_timeout() instead, as instructed by documentation. 
Additionally, are you sure about both delay parameters? They are both much 
smaller than in original code.

Same comments apply to patch 2.

Best regards,
Jernej

> +	if (ret < 0)
> +		return ret;
> 
>  	/* push down the phy io line */
>  	writel(0x0, data->membase + EMAC_MAC_MCMD_REG);
> @@ -64,7 +60,7 @@ static int sun4i_mdio_write(struct mii_bus *bus, int
> mii_id, int regnum, u16 value)
>  {
>  	struct sun4i_mdio_data *data = bus->priv;
> -	unsigned long timeout_jiffies;
> +	int ret, tmp;
> 
>  	/* issue the phy address and reg */
>  	writel((mii_id << 8) | regnum, data->membase + EMAC_MAC_MADR_REG);
> @@ -72,12 +68,11 @@ static int sun4i_mdio_write(struct mii_bus *bus, int
> mii_id, int regnum, writel(0x1, data->membase + EMAC_MAC_MCMD_REG);
> 
>  	/* Wait read complete */
> -	timeout_jiffies = jiffies + MDIO_TIMEOUT;
> -	while (readl(data->membase + EMAC_MAC_MIND_REG) & 0x1) {
> -		if (time_is_before_jiffies(timeout_jiffies))
> -			return -ETIMEDOUT;
> -		msleep(1);
> -	}
> +	ret = read_poll_timeout(readl, tmp, (tmp & 1) == 0,
> +				20, 10000, false,
> +				data->membase + 
EMAC_MAC_MIND_REG);
> +	if (ret < 0)
> +		return ret;
> 
>  	/* push down the phy io line */
>  	writel(0x0, data->membase + EMAC_MAC_MCMD_REG);
> --
> 2.25.1


