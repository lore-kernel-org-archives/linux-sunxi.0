Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793698820;
	b=itF9B9avImmvXo6iDQPu+yX1+XZEnhXYgMYaX2ILv+0YOfejHfkRE/BSjiUfG0nW/IE0
	 /A7CesO6Q651wOw6dLS/No4JqRQh+ErL9mwPnevlSDCdYiwvVLadm59u5CHbCDJabjgER
	 bIGWxO2MDiFQMXC0psPYh8J5MNGBAqW5BPF/aJwF7SufTj+4dwUALexTzZ7faKSKBJr90
	 8uttZx7eg62mM00TfwpCfB+7YDIBVAkBel4TaNXsiFJOsWCOa6WSWeOH3A2emiyNcUzYJ
	 q7RgjsIwgdPjRQKMoM9n0WP2a10CvCC6ectI3Epj/4Sf7sy4Q3pBWFvn4yq3oza4/ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
	b=oYSuurHNkyo4Os9rnWlQ4gqryRPibBYs87HDqAmTC7WnmTtdZkjvCfWNm3wsXfR5L68j
	 drbAehMKU3hEBHJhdjG3XSHUw32jHVYiCz0faKt083BwPpF88oTh7uxkMOQVXO7CAO7xI
	 2TApRt7HwgQ/CTRDBAf+j6pIexQBUUx8+S4/H5VwmTo6WKHqvWP3UyCQb48YeNJVuH9Ix
	 WH5V+fwNb3Zoti9kt6rHiN1ohwdpyqcnhLrr9GhamTZVjrOJKbZWGCpEUhCbwDhK5HvM/
	 9BofuGbUkXvfvFMc1VRwQaQSmCsfXJ39NzseZLMztLZpSFbjXIYGT2YxCyyKOhv9T+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wb5rI4l4;
	arc=fail smtp.remote-ip=74.125.224.54
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF46606A32C
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 09:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CF46606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wb5rI4l4
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67989a98f8bso2660745d50.2
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 01:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793698819; cv=none;
        d=google.com; s=arc-20260327;
        b=Ea0QjJjUgVItCdiN+JMjbFeTfOXglX1SXpncM/nTAbpxXxKIVHu9BFv1SavhP693Rp
         0mUOWZhrbuolOG9epYDt3TPLrHJkQpdg7JbzRs+IwP64z1tkw9WJd2jzWdlGErp4EP9C
         QOVBviaHuS2wHJFLstJorQWeWlAvDkLmDo39pfdwRjTk2hTCbzxuAU+w0+noc7Y2u09r
         MtN6acugA2iXumPsnNt3kseZCCC+pzzlzO0oUbPmCEjLbw4Nf5xLCA66M/Fy1k5k2iCy
         VQ0o17nBTk7L70s8MwVLsJGKruwPk9HbiOWuWAbazTLaX5gojzIRJ9j7pQC1wtkcqFLx
         Vbng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        fh=crJdCLRIsakx1DA/wuO7Sx2OeQD6+O/G9uuW1hTlO1o=;
        b=Est6fF0RypHmvxUHVp8QgkmFDg/jK6k5ry320DwYeizpXRSI+NdI+G5PhK9icWQ+0R
         5QmuEzj4pdO2JTq8PVmEGe3nbC0onYX9a+c9y3gKeapAgry4UIcMXh65bysYvm2enddh
         cUY17DuwVIw8tiGJpRW+KeuXICZiHJvzWELszSFjqwd0NSoSOAsuCKNb7WtGaloxS2g6
         1ayoSbqq0qLyItJIrGSz1WMeYu0SUn8YAn7AFn5CDzf4XBvjegPoe0s1foG8lpwBpcC8
         hjxb+YdrVBMnvQ0Zaw2Nl6luCkCtVQxkZeU3y3Cw2434A02p0YJNij02pld10qGVwyJo
         AylQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793698819; x=1794303619; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        b=wb5rI4l4pAX5NIuL83JvllXi/Gu1azxhtSOvT7ji4e0bKKkwn1O5+75np3se/44+QY
         ruhA6/2jrZyXy5Yy+TdpR5uxhi3srTDqp8vK9k/ZI8WmjMUI81z3vTaWc3JAg8n/AJQ2
         Mtmbzd2Kuc4kPxxdjvUl3vHRjjh3AcHUlwB0hAnLbEsDxbBhUd6WiCRbbErViof6N3lF
         2H8l2fNVpo6eX+mW5VC27aRb4QsHi3whDxgZzaWB7tB1c7iU2x49BxHzrv8CyE5yVzD0
         HKDxOimvizpfZb4Esv49TgdtTxwjUKXBGh6v/y73/DMlgsA1L5pmvnUYfpWglpicG2G3
         0TTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793698819; x=1794303619;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SoUavllOOu5q4EGy2EwAVcdcsFqC0ZHBZHZDDMPy0Zw=;
        b=JTi+8WUCKNQMFrREoUKIL7IuVg6dFLMPYfMJAC2cuql7xDgrMTcuKEXIAZXuOaCd7d
         sMgtyXkpXQw0qF1C6lx9cUMqyHc35/DtZ6TyaMVgudzWKZB3l/I4a6OAAT15JRJcs+8Z
         Z9MYldzqvDakl9q28H73ylC8xJHbRXyINq3Ibw5QRp3b/l6Szs1iWs8WsSFPFXgR61BE
         vy2Ac5V/TLUKQi7Y9nqliHsiEeEpxfjoSLj5qLDoIy0tZtpWRTTNI2PTJx3t8jsXMTw+
         4onngYNeoUMnPLv5IarUnXAAdQa28l2m88t4HxUsgwOF1u7RKzXk7mj3e7eM0P8pJ9Gb
         ckQA==
X-Forwarded-Encrypted: i=1; AKwUvBz7amuGBKsmLUSeDS0nyNLyfmU/dFbJX3GJaEscLdDJWfbW1Nv8ix6mGbw7lGPCBLAiqYtyGYEUlm0prA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9WB/wdel2/xvtNMoaCxUP3SwjLX7f8OjLA8W6yPEAnjUvWxiwL
	B5jdS3UKUHchq9wBOv4vUhcFvRfNO64CmjiEceAuUAHQUeC+9is6WGWxlvOAILnv7sx7vmDm7f+
	fZpfzgHzmgd7PrQGHp6ZWCWnMdUOEeg==
X-Gm-Gg: AYBFou3InYXbqcHkkDO1HfkpxXtSC9M0Lc+GuDOPGPMThFUk0X9VKKOoGm/OKBveJA0
	GPN9zMTbD/X1iXvBa1XSFymFXKRR6FzDTUvljUrISh8bv33KU+XJOW4QcbYP5uI+DKszu32NhyR
	8KYJGIrigejrZs+rBRHNPFOisE00hw6QDavPYam4Ogcjxnijr+nGqLsHXzVHVevE91vZWxtYCu+
	DK5q8XC+NWykJsJE22Ek4I78R/onoLkUrUGldZqvq3ogEemBYwTI4la/2+B2a0jZy2KO8JZkQmf
	F5LffNuocdcjStIjPj7dr/ey2N9AyTfT1CrhDeS5kN1IscanOYegggzPUInR71iDzcyeqlY3+aZ
	cQk+u6CTHR0TECzoMPq3jIbMTfIt3dwTl4ZTZ11PoXegZ7YGcYem3pJyjEnNw6+Avfr8lcrE8bt
	HbxTwocR8HNz3GMD8=
X-Received: by 2002:a05:690e:80c:20b0:671:3c9c:e5ad with SMTP id
 956f58d0204a3-67ba4f070c8mr5998587d50.49.1793698819403; Tue, 03 Nov 2026
 01:40:19 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
In-Reply-To: <20261103-a100-thermal-trips-v1-1-73bce7ff0767@gmail.com>
From: Rajan Yadav <rajanyadav0307@gmail.com>
Date: Tue, 3 Nov 2026 03:40:07 -0600
X-Gm-Features: AclHuK-4a97yVJVbkGNNnQIL8viqTEZhruO_MoVfFcSl06giv7eYpRWt0lOZS3E
Message-ID: <CANxy8yTAJ=9AwD=s_oVpvnoQWiip2NDecscAJmccRRZ8bCfzww@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a100: Add CPU thermal trips and
 cooling maps
To: rajanyadav0307@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For transparency, per Documentation/process/generated-content.rst:this
patch and its changelog were prepared with help from an AI coding
assistant (Claude), which drafted them from my instructions and helped
run the tests. I reviewed every line, checked the values against the
Allwinner BSP and the A133 datasheet, tested it on my board, and take
full responsibility for it. Happy to answer any questions.

Rajan
