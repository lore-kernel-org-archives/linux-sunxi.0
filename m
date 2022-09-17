Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB737C
	for <linux-sunxi@lists.linux.dev>; Sat, 17 Sep 2022 06:54:19 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id bq9so39283949wrb.4
        for <linux-sunxi@lists.linux.dev>; Fri, 16 Sep 2022 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=1Nafsqgi+ey0lvESaq3P7Ed7c4PrgjcfWmeY/VtoS1k=;
        b=hbkqdT6B0JIb5xRyjQ9vZaFUiaE2784NvVaLLdQGt0tGmAIHQd+hEL9UVXJH1zpQ4R
         COcXfoxwhqnGAGGBffs3stiK0ijUBpxN7VoS8CaS2+4RWy9GzMo451qN69Ds1g2SByw/
         QpH3scY0uUqXaUnKvc6rMjkHEIVNokwIi/buUXRd1CpTmHX+n5q8pavaxJPWENFfe4wA
         k02b2clrS17Vx0PnbZfgusllPmk3xuFShima1mei6+iYOVPgoR7YE38bHbFqVrFZCFfj
         VKS8VY0zKBgj1XZz9++/pZgyEMWkv/UpPog52PskeqVS2dxzNHCcVwS6RfnHh4b3MMzh
         Wyxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1Nafsqgi+ey0lvESaq3P7Ed7c4PrgjcfWmeY/VtoS1k=;
        b=tmVWZr/me4RWi/EzaReWogOlpFYbJPklbH4AzKqZRsb8VLxFDgKPuFG76yBL3cDyAl
         nH4D5DgFDmZIepId3+N406Puu00zupvGQLA6ajjp9IU9WpI4OjloYRkwkmTyFYDwRqHr
         eaSfKu0sPSaF0Vrx+nSDNXBcu7+ZIsjer57qkX6PIx737eHpxEyLZX1Xw5DveEzuv1Ue
         dbjgu5C6Kaxcnyoym+Ey0LPXFiNGI4vN+CRgiH+sZ2f+zTd6nOTszMBC4STLR295IMT0
         oLEV14uFA47IoCUvD+/VeZu2julM0xyUkKaOacP1qdAvLU0RE3mEkc10pwgkVQjG4TLf
         edTA==
X-Gm-Message-State: ACrzQf2n6RdfI2oJmwj5keQIE3o5rufPFWLl8vK1Bi42+gww24kWrqig
	3+HKZ7dsG/5cH5WVPy3PN3M=
X-Google-Smtp-Source: AMsMyM5SsjWaQCzqj9tgf7b/iw1sUIKuj+Zy1CSKV2OTWTOy+/oMLHzvkEOg7w1SPFKKUgSNUsyKgA==
X-Received: by 2002:adf:d088:0:b0:228:a789:ce1f with SMTP id y8-20020adfd088000000b00228a789ce1fmr4683212wrh.461.1663397658016;
        Fri, 16 Sep 2022 23:54:18 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id d18-20020a05600c34d200b003b2878b9e0dsm5051092wmq.20.2022.09.16.23.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 23:54:17 -0700 (PDT)
Date: Sat, 17 Sep 2022 08:54:14 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Liu Shixin <liushixin2@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] crypto: sun4i-ss - use DEFINE_SHOW_ATTRIBUTE to simplify
 sun4i_ss_debugfs
Message-ID: <YyVvFgHri4UmFOAU@Red>
References: <20220916141340.2174495-1-liushixin2@huawei.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220916141340.2174495-1-liushixin2@huawei.com>

Le Fri, Sep 16, 2022 at 10:13:40PM +0800, Liu Shixin a écrit :
> Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
> 
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>
> ---

Hello

Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
