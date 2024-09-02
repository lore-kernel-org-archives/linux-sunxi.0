Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702071CB51D
	for <linux-sunxi@lists.linux.dev>; Mon,  2 Sep 2024 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725290952; cv=none; b=OGPt4n493rhcNX9IJKwvwM+iQuWLPCeVxwOo8odNEN1+gnsiKyQArsGDNBqL+TyApmBRlCW7DSrYy3FiGRmpSlsf9a4LMuBBzzTg7nLAy6FypR5LdJaQ8Awx84ywMwWOJ0FwS01J5ozADtDFPii+AMMwe2NHK0paiVIsKN0XvBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725290952; c=relaxed/simple;
	bh=voO+epwgJXAM5598YdEmnMnOEo9In9C+SSHPfvNt0jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ekt0xSqNZzoD01uM2oCa1THZhdlOIWN8TvX3k+EKYOXFeShjsLM5uTrP0qlYrOkTYrgEALRbWjbGUT752Vo7hLx1OmKCEKl2zcZoEzmLRz33ltLGydPnhqoeGmR7nYKP2q7okBz1QatoSbyoS7z1NfmUt1NoiiBUySIAyzosBXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GRIyxIN8; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GRIyxIN8"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a8160a7239so205737585a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Sep 2024 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725290948; x=1725895748; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=plSfTPexmyrm/qaFrlk31d5Kx7ZPUKuvTHifHzZ6Gv4=;
        b=GRIyxIN895EW8NXl1ivLA+pn0ld7Na5rpD/ZMhWGzo70WehxFy0tzwz8aoH0vz7Vjb
         MBxmMs2R1baUKLeoPkv8iFGeniqf4G7mEZRMwasAKKePcXwqM4qLsHwhvg0qKQXAV0Q0
         /a/tio/8Yc0Pktxe4dMqkYnZchxPIrMKPBf02ICpsJAfCKzlj6E7bFFzpy/71Qq9Mjue
         21eehk6Z4nN0dojFCUPUs52aG792E6XLXeUCPmKoMWBkE1cS8IxSxzHnUQ4iFrYuJoR6
         6hhoh//GyARO+37jDN2c1eJRoZRRaDtsDAYYZYh8lyIei4Z+N1y8wGg0/qCCKzqEWEFM
         erXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725290948; x=1725895748;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=plSfTPexmyrm/qaFrlk31d5Kx7ZPUKuvTHifHzZ6Gv4=;
        b=Kh0LnZzOLRJdRbJnUmlkQsRV9+mjT6O9+UsN7Q9fnlJSmNpEArFRTcoVaiZEns2FJq
         wkpS+6zdgdjsvHlramhS9U0d1+djVuStz3babyTth+ggDmUYiv/eyN8s4CBnmsU0wzxq
         fafczgJfs10LJ49gigARYDfkEOSYINAXCzYWFq55ytfBHLOHL/pBqZUcMOh0z90l4pZJ
         jIJgkTziUQhmtt627U+bFGNPQ58H5Y9IfUuarTgylBwOLfJwcsJXOewZmYJAx/M0U9es
         oC4EeFXtgb07ULyEKjEUVUrxXVb5dnPQPbhFCMJT8mVQRvZGH1ulTCwIMvig/2e7Svka
         7gCw==
X-Forwarded-Encrypted: i=1; AJvYcCUiSk8PLNr3Ve1zyPgGvK09JWPFtCNReNiZYGQrAhuNy5ImhGqWVa+YbmqQ48jWnIrfdm3WtAlg8IzD0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCI8w9uGnhXf0+jvAhkCOsWl33ADuV/EjRUBS0nyp+LIpjN/Zr
	jYYMeJpEEVVjmZVyOhKEZ3rKuYJkMMUZf5DzEVtGj1o5uhhI6aez
X-Google-Smtp-Source: AGHT+IEnS8WLdyq76LYA7OL3T+DyPPZmn0CFDzFBQ/SinGFiTDBUPLZcW2TYcilzq6FZ6fMfBu9Mdg==
X-Received: by 2002:ad4:4c04:0:b0:6c3:6626:9042 with SMTP id 6a1803df08f44-6c36626967emr33194906d6.37.1725290948282;
        Mon, 02 Sep 2024 08:29:08 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c340c96825sm43273026d6.75.2024.09.02.08.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:29:07 -0700 (PDT)
Message-ID: <27a0d076-ed61-486b-b961-8a0982e7b96d@gmail.com>
Date: Mon, 2 Sep 2024 08:29:01 -0700
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 5/8] net: mdio: mux-mmioreg: Simplified with
 dev_err_probe()
To: Jinjie Ruan <ruanjinjie@huawei.com>, woojung.huh@microchip.com,
 andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linus.walleij@linaro.org,
 alsi@bang-olufsen.dk, justin.chen@broadcom.com,
 sebastian.hesselbarth@gmail.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, UNGLinuxDriver@microchip.com, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 krzk@kernel.org, jic23@kernel.org
References: <20240830031325.2406672-1-ruanjinjie@huawei.com>
 <20240830031325.2406672-6-ruanjinjie@huawei.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240830031325.2406672-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/29/2024 8:13 PM, Jinjie Ruan wrote:
> Use the dev_err_probe() helper to simplify code.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v4:
> - Remove the extra parentheses.
> v3:
> - Add Reviewed-by.
> v2:
> - Split into 2 patches.
> ---
>   drivers/net/mdio/mdio-mux-mmioreg.c | 48 ++++++++++++-----------------
>   1 file changed, 20 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/net/mdio/mdio-mux-mmioreg.c b/drivers/net/mdio/mdio-mux-mmioreg.c
> index 4d87e61fec7b..b70e6d1ad429 100644
> --- a/drivers/net/mdio/mdio-mux-mmioreg.c
> +++ b/drivers/net/mdio/mdio-mux-mmioreg.c
> @@ -109,30 +109,25 @@ static int mdio_mux_mmioreg_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	ret = of_address_to_resource(np, 0, &res);
> -	if (ret) {
> -		dev_err(&pdev->dev, "could not obtain memory map for node %pOF\n",
> -			np);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "could not obtain memory map for node %pOF\n", np);

Besides that one, which I don't think is even a candidate for resource 
deferral in the first place given the OF platform implementation, it 
does not seem to help that much to switch to dev_err_probe() other than 
just combining the error message and return code in a single statement. 
So it's fewer lines of codes, but it is not exactly what dev_err_probe() 
was originally intended for IMHO.

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

