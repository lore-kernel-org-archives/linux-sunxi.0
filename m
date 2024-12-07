Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE148219FC
	for <linux-sunxi@lists.linux.dev>; Sat,  7 Dec 2024 17:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733593540; cv=none; b=D20EcTVaB5MUeuFvvf9xT5t4oGSuJ9PPCbH0EcJsFXOm3dQDHBMEQx6wWhdaU/IGEyBWpCgpygKN90hA3dF91KCgTicAKDw6K+zt8/KUXnJ2v0PgSCYNy7svQ/IFZOnMobcfajBFRs6kLLegGbKMlhVgVtmLwEK4LyikqpmLf3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733593540; c=relaxed/simple;
	bh=6ACLIbj0m2p/gYfZg8qQpPjIeXEXhY3p5smFYzkPywY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2VjHyE9PwdkqeJjpk7cRHuxct/NLPUAM3qyvVEJmdNz4v1+vE1lpQq29MCwnTSUBBIpTa5JAcX/5iY5oHBtTW8aRxu5cQMc/qn7Nh7J1nnIUfVep3XvpMlJh9rdJxhcGCpRyPDZGrcSToL9RoO3MR6zqcsMGX07fBXgjv0KnEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3PY23e5; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3PY23e5"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5f29db2615fso225611eaf.2
        for <linux-sunxi@lists.linux.dev>; Sat, 07 Dec 2024 09:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733593538; x=1734198338; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b7u+31u3YeBNl7LbEDjuCwStYnmV/fCXULkXKvpnwA8=;
        b=b3PY23e53qaDIX15PxwbJKy607pjiM+no+/WfJRPiiRSgT9HidLD96ipXzgaHfn5tn
         mIMT/9Ie0/+b7Bc6PPShkSDEmMFhUOaMqL22zAX5zozVJN33HQbcN5a71xhC9rT3gIM1
         vJnfze3TaZ1+pQr85NUznEoztsalp7GRjq+C7V/gw4qTOdDO0GIcaSm4GQWVXKvnnGZE
         sVs7qqryRJyDFDjyPO1F8YvCoIeYQaCfdZr2g5dOOFV/zVEsPtn2WFgvytiskTHWIfsa
         11DPBkHsdWBfkN05qvetN7OPiSrKnsCSOZkz5TlOtKmyNv2iOOgWXOZKUhRIJDRiEnue
         4rbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733593538; x=1734198338;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b7u+31u3YeBNl7LbEDjuCwStYnmV/fCXULkXKvpnwA8=;
        b=EWZzf9DgQ+SQbrQAVrNhqLPFwrm+h5jHy2PrEFkkzCysqCNqre4mUC/ecQVarVoLAq
         XH5Wc22nfFLX/0UcePXOWyFMVmLPWJgh9f+L9Rk1cGtWxJpYKuyDBWUCcWwSeracW1RG
         zCZmvkL/G3s14D6DzS8DLwyLcG6V+z29hbrLFjujaDv/xvncSmWDvJbmG6S67977OK1/
         tGajEZixx6bPksYpnPhUUAZkTgYDd0LX9Ur2b8nnKxPKSJut+tLLlHDEmfCoqlrQkG5m
         pgVYq2a45Dt0A0BQOOuuTD8bwQ/E4couoZzth6Upc4Fh18dw0oUI6FrEMg9BBS+cl/T/
         meXg==
X-Forwarded-Encrypted: i=1; AJvYcCX8kfyW26uBp5WY+LVnhxdHfqf2uEfMCUwoEOxHhM8qdOdG0WcPqedIHYoJwc2BjWW6TDO+fk5YPMrh8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI2psOvceCA855YhR81Je7u9CwexoD0g4C4w34rts72cYZugFw
	3K4XjVccwrXpblTzYjSLRG8VWzV6RPlxegKR+Ax45Et55+NVAZZr
X-Gm-Gg: ASbGncskSXzB/Qr43d3Wh/cwqkaw/aLK8ExdBGww4u9bEGCZ+zXaliv89a1U1i//aLb
	ecTdz/6KiP5YESJQ0ZiTJYOU5hwkOvFFO7KGFxqcww4dLc2u7M4OOeNeMBYs6yxcn2NbLg3eGSn
	SYdfgO5YbQFShvACRlpgIrcQMxXehWFABLNpSFp1d2gWEyYhR9hSF7O2v7u1vxft+C2sfRlLVGF
	6r3mD4jpn8pVexOtkttoyvOzFcZ0tSJuuAI
X-Google-Smtp-Source: AGHT+IEEIIxwno7M9jy0PuuqAGrIdi1MzgT6bGTTwtmEeVXH12xtChFy+ymdFQtAfHwdBrm9C4sFsg==
X-Received: by 2002:a05:6871:a6aa:b0:297:2719:deb6 with SMTP id 586e51a60fabf-29f7319b029mr3489071fac.1.1733593537886;
        Sat, 07 Dec 2024 09:45:37 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f5694a265sm1545266fac.34.2024.12.07.09.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 09:45:37 -0800 (PST)
Message-ID: <675489c1.050a0220.8d73f.6e90@mx.google.com>
X-Google-Original-Message-ID: <Z1SJwLWeGHCRC14n@neuromancer.>
Date: Sat, 7 Dec 2024 11:45:36 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Martin Botka <martin.botka@somainline.org>,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 3/5] mfd: axp20x: Allow multiple regulators
References: <20241007001408.27249-1-andre.przywara@arm.com>
 <20241007001408.27249-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007001408.27249-4-andre.przywara@arm.com>

On Mon, Oct 07, 2024 at 01:14:06AM +0100, Andre Przywara wrote:
> At the moment trying to register a second AXP chip makes the probe fail,
> as some sysfs registration fails due to a duplicate name:
> 
> ...
> [    3.688215] axp20x-i2c 0-0035: AXP20X driver loaded
> [    3.695610] axp20x-i2c 0-0036: AXP20x variant AXP323 found
> [    3.706151] sysfs: cannot create duplicate filename '/bus/platform/devices/axp20x-regulator'
> [    3.714718] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.12.0-rc1-00026-g50bf2e2c079d-dirty #192
> [    3.724020] Hardware name: Avaota A1 (DT)
> [    3.728029] Call trace:
> [    3.730477]  dump_backtrace+0x94/0xec
> [    3.734146]  show_stack+0x18/0x24
> [    3.737462]  dump_stack_lvl+0x80/0xf4
> [    3.741128]  dump_stack+0x18/0x24
> [    3.744444]  sysfs_warn_dup+0x64/0x80
> [    3.748109]  sysfs_do_create_link_sd+0xf0/0xf8
> [    3.752553]  sysfs_create_link+0x20/0x40
> [    3.756476]  bus_add_device+0x64/0x104
> [    3.760229]  device_add+0x310/0x760
> [    3.763717]  platform_device_add+0x10c/0x238
> [    3.767990]  mfd_add_device+0x4ec/0x5c8
> [    3.771829]  mfd_add_devices+0x88/0x11c
> [    3.775666]  axp20x_device_probe+0x70/0x184
> [    3.779851]  axp20x_i2c_probe+0x9c/0xd8
> ...
> 
> This is because we use PLATFORM_DEVID_NONE for the mfd_add_devices()
> call, which would number the child devices in the same 0-based way, even
> for the second (or any other) instance.
> 
> Use PLATFORM_DEVID_AUTO instead, which automatically assigns
> non-conflicting device numbers.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  drivers/mfd/axp20x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 5ceea359289f4..bc08ae4332604 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1419,7 +1419,7 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
>  		}
>  	}
>  
> -	ret = mfd_add_devices(axp20x->dev, -1, axp20x->cells,
> +	ret = mfd_add_devices(axp20x->dev, PLATFORM_DEVID_AUTO, axp20x->cells,
>  			      axp20x->nr_cells, NULL, 0, NULL);
>  
>  	if (ret) {
> -- 
> 2.46.2
> 

Using git bisect, I found that this patch breaks the CONFIG_AXP20X_ADC
option which is used by some of the battery and charger drivers for the
axp20x PMIC series. My current assumption is that the
devm_iio_channel_get() call made by these drivers worked correctly
previously when the PLATFORM_DEVID_NONE, but now it's not working
anymore. I'm still testing possible solutions for that problem.

Thank you,
Chris
