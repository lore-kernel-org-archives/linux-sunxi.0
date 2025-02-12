Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C46C2116F8
	for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 15:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374029; cv=none; b=izcYs+DhmqCjjdKdPraCBs+/eo62iHE7jySQ09fVXBfavOPZ4Wmk7btNOlCWW6Xa+FQHDMQnwrSp9lu2LXtEzUi+xcdSdPdchb6Gb2v1vAqeAWcWjJLEScw0v8ttLPNtLjVJXoZCKPjjeDx5mchUEtJl+LA65Krdlz4dPwihnsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374029; c=relaxed/simple;
	bh=vXb91Ul9iBMWPquG3+W+4DcTajC2yLwY7ZGjkG3818w=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uM39tMqt9gpofymrYKEoA24VD/9csHWE9a/cUln4llfHNsEAJVlqFXAU2JRCfXdNHV2a22+tYVL8koGGoOBrUqFdTEXm3pDsDUgV7D1cdC2b7qTgc6FvO3MDdY70hTu6R4lb+oLKilmmBAydBdYl4KribN0ujEw2211rR2h2gU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZET7F9AZ; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZET7F9AZ"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f3ab407232so1837355b6e.3
        for <linux-sunxi@lists.linux.dev>; Wed, 12 Feb 2025 07:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739374026; x=1739978826; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6lBUw25J3aG4YuuDsQwkeYgRv1vrc7t3xa9HzM9MOvw=;
        b=ZET7F9AZnSvV7021CO8isWSwx9M7L+TuIfMu0eKR9av1NvtbPOc9FwgDtch/rqRFpF
         IcXiK3EdsJ+vW52YOpsX8Rzeth5HEAjg57uwFh5awQgw7jAU0f8qY/k5y94EhnoV9ovj
         NnFw46zzZ0siLkOgd3HCuVwudIc211iC37TQn0bXNeRODe369Akf8C8ll+JrkXeE0Gjg
         j8cHS+MI70SW5YiUf7OcEn1/IqS8dLTgeBJg9YsiusE0SfSJXtKKjUHeD4Z59axAsXZu
         xZ4YCoEWbGyM73Ggu19QRZSq/PEZt7iqnAqT21VZ6O34YVZ+eWhKiuWFg8vKxBdtFou8
         AuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374026; x=1739978826;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lBUw25J3aG4YuuDsQwkeYgRv1vrc7t3xa9HzM9MOvw=;
        b=wIuNCkkJeOEgnrkolJRm1O76djP7Wjr0Cbuy1g2ZtouKrg+Ldbj7MbapWCp7gO61ou
         m4Zjzs2X8voknImgzr2hyN64Rlm8qnwIkCTk6+EKAMsXCZbtxi+85UBP4KcxS9eTqeN4
         9HDFyOszoe5SbnF8EHdBdQtm2INRq88p4VgKqX/fyN0VD9IQA5T+mKej0dVxEZahiL4t
         pgu9tIl/95uNL2CHZHEou8O0YJogwVXSjOkKHSxNMHMCTD+T8LwQrgcEr9mHEV0n5T4E
         mEhmiGkcWJwVYFDJiLTOvST8waDhZXMedWpqwq4EVCJJ0R7efp3KBjVdErTDMqeX0AaD
         JK5A==
X-Forwarded-Encrypted: i=1; AJvYcCWmDz07thuVgDYAHGXusL8FcI5xVJ91vJTWnkgf3OL8916Hiq8Kra0RnfbiLfaWSMmlH3DhP1GuADXIPQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxUaP/IpATYdFwT8jMzeR+HHsuMStYgXN27oE1XEyXR6y6HTCE4
	paRa2UIGR6Rw0y6QvzTmuEhF9sKscugdxIA0x0asoHKrkv9u5gXa
X-Gm-Gg: ASbGncvycJbpKtcuLoHUR8qE2CJZ8nyKbto6QqavorTEw14hivNHguV7CmAiknCfqr/
	NkIzWDvoTTCRKKFySioGbj67dH0aeGo8Ih391bh8Ygmj7WfdIR98GAlP2976wDUfLBM2E4KHeNO
	elv5M+HCSp3AMtaTthjXg38VT7sbJ0gV5hN0xNRikf0j8ho56QaLZyX9rNqipZGQ9R3bk0n/cIN
	B1aJ1k3ylpINbZeGoy2xMMkSWbEoO/V4uWo2osUsFgj7wIkr/Bzu6ns7U1bYdEJVUYhr3LID8uI
	6NtHvWyMxEO5LKUnHd3dmQ==
X-Google-Smtp-Source: AGHT+IHo4moDm0XlC/zbhfkvivNmDn6gThhjx1PDMEofy79uK89Vl0WpOwwZ4GUyPbza40pljwyLmQ==
X-Received: by 2002:a05:6808:2518:b0:3f3:bb75:1706 with SMTP id 5614622812f47-3f3cd5cbae2mr3016870b6e.9.1739374026359;
        Wed, 12 Feb 2025 07:27:06 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f392481cbfsm4066579b6e.39.2025.02.12.07.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:27:05 -0800 (PST)
Message-ID: <67acbdc9.050a0220.11fcb1.a43a@mx.google.com>
X-Google-Original-Message-ID: <Z6y9yNpdsVUZ1Q4k@neuromancer.>
Date: Wed, 12 Feb 2025 09:27:04 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
References: <20241011102751.153248-1-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011102751.153248-1-privatesub2@gmail.com>

On Fri, Oct 11, 2024 at 01:27:31PM +0300, Aleksandr Shubin wrote:
> v2:
>  - fix dt-bindings
>  - fix a remark in the driver
> 
> v3:
>  - fix dt-bindings
>  - fix sunxi-d1s-t113.dtsi
> 
> v4:
>  - fix a remark in the driver
> 
> v5:
>  - dropped unused varibale in the driver
>  - fix dt-bindings
> 
> v6:
>  - add apb0 clock
> 
> v7:
>  - fix a remark in the driver
>  - add maintainer
> 
> v8:
>  - fix compile driver for 6.8-rc
> 
> v9:
>  - fix a remark in the driver
>  - fix dt-bindings
>  - rename apb0 -> apb
> 
> v10:
>  - fix a remark in the driver
>  - fix compile driver for 6.12-rc2
> 
> Aleksandr Shubin (3):
>   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
>     controller
>   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
>   riscv: dts: allwinner: d1: Add pwm node
> 
>  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
>  drivers/pwm/Kconfig                           |  10 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun20i.c                      | 379 ++++++++++++++++++
>  5 files changed, 486 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-sun20i.c
> 
> -- 
> 2.25.1
> 

This patch has been idle for a few months, would you mind if I took
over shepherding it to mainline? While I don't have *this* hardware
to test it with I have an H616 which has a similar pwm controller (and
for which I was going to add support for once this made it to
mainline). Otherwise, I can just wait patiently and then tack on my
additions once this has been accepted.

Thank you,
Chris
