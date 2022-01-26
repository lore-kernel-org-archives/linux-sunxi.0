Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C02E168
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 17:14:28 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id a13so183327wrh.9
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Jan 2022 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gXtdrW27fCZ/wJUPBVbcRIlDfwjyibpVlA/v0Qe0N+A=;
        b=ShEI2vtBBOEzdM8KBa2+C+sra9rF3eUL8rq9LzYJlSnCdzLTrR9bprTUNRFKfPviWE
         9LxSGdHftoFFaEfs5hs4wlUS92fvaNMhsVvPgTvT2ilBpLXxDvPOF61ztFbDBhyABL1T
         NeAJUgNQN40uFADgvWGHHvtXEXm6/Ml8nuddZ7Oji2LkhqqcjoyLsgnsrnl+kd6/i1iI
         yQRqPJInXft4GD+ohxuxSx1AAny0JGtYF1WIsfY27wSah06MVOWb4YXlTQSzlElHgJAI
         dMjR619JNdTUz0aIjR8ixqhJOIRS0C31q6OhH3D1GxGbZ8jz/18gsCQB3V33I37fzdsc
         T8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gXtdrW27fCZ/wJUPBVbcRIlDfwjyibpVlA/v0Qe0N+A=;
        b=yvtFGCybGrgKiXocDh0/xRGkR7EVGFAb+fCIDKdoEsy9BYha//lUcWo6nCxbxuPKYW
         G80hibYCHkMpeeYuvqa3QXNQ4/DGiNcwv4VVoJUSu3X6+oj9xyAR61/QLCwdc5kpaKoN
         QhrVflYQJp42G/qNJV3SHXE8wlDJdSIfHzYjlTrW84H/T9k/DY2yM+1wJGsnWUd6xTWI
         7wO/QbFPyqhS7aYlRrveAijshSMsbeU1xe4xexE6bACciMftEnFs/q1cgVexhli/CztD
         fys3Pi6NpCuwkPGzGtY3K5J92IaGCoppQgpxzQaQDUmorSo/gnL51ZQul1LQSQMTu9FG
         dcAQ==
X-Gm-Message-State: AOAM531DzY656CbtyMEQ/NbKMMabY/K0Xe0X0ZrlFpiXQSOlGaambxue
	bzSgOzBGVjJahGP7/CavMxg=
X-Google-Smtp-Source: ABdhPJwj+3itbOp8dJx8AHey5VYTt5YOotHUNr1kojxGb+QydODRJny0bAdqTKmSHnhQdy6BUYrH6g==
X-Received: by 2002:a05:6000:81:: with SMTP id m1mr18100420wrx.385.1643217266591;
        Wed, 26 Jan 2022 09:14:26 -0800 (PST)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net. [86.58.32.107])
        by smtp.gmail.com with ESMTPSA id c8sm4800962wmq.34.2022.01.26.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 09:14:26 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: dwmac-sun8i: use return val of readl_poll_timeout()
Date: Wed, 26 Jan 2022 18:14:25 +0100
Message-ID: <5533854.DvuYhMxLoT@kista>
In-Reply-To: <20220126165215.1921-1-jszhang@kernel.org>
References: <20220126165215.1921-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi!

Dne sreda, 26. januar 2022 ob 17:52:15 CET je Jisheng Zhang napisal(a):
> When readl_poll_timeout() timeout, we'd better directly use its return
> value.
> 
> Before this patch:
> [    2.145528] dwmac-sun8i: probe of 4500000.ethernet failed with error -14
> 
> After this patch:
> [    2.138520] dwmac-sun8i: probe of 4500000.ethernet failed with error -110
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/
ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 617d0e4c6495..09644ab0d87a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -756,7 +756,7 @@ static int sun8i_dwmac_reset(struct stmmac_priv *priv)
>  
>  	if (err) {
>  		dev_err(priv->device, "EMAC reset timeout\n");
> -		return -EFAULT;
> +		return err;
>  	}
>  	return 0;
>  }
> -- 
> 2.34.1
> 
> 


