Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2661531F9
	for <linux-sunxi@lists.linux.dev>; Sat, 12 Apr 2025 03:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744430009; cv=none; b=JR1lGFVcbFkK+P9ojWmTXwLsRSDK08ecdUvTpCI2tHFjWeIZDbFL/awxIaK7nzqBmmeGk6y/d2KajpiSxPOkgmMZT1I7U01FsNGeG1svoaRzFrhXfOE/kVOVzH57AyKgfK/I2+xhucAcHVAQrB9qTFo9Fsct/P4z0BtRBduu8Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744430009; c=relaxed/simple;
	bh=wTzkihgJDk+PfgalYMEfICtXY4uHOcjzu9cQSMU9SvY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gkNw0E3XED1Mi/DPRHX1fh3qtAA4cz5Eo4GS7IxOETFFlK0YG3iCU2BXNQmorlQFVriYpVkd3f9hjYef71QrBwmKqza1+62oEGJ3ITLcuUaE5f3JL1xihMB6i+3C2VqeKe0DV7WLykx+csoL4IEhc1XNosf21A+qUEby8OpNCNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gBQ1EgIo; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gBQ1EgIo"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736c277331eso3531447b3a.1
        for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 20:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744430007; x=1745034807; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9cCaU/9pItXeyQyKncm+hw9C0oW5ARKbMzPEkSk/lu0=;
        b=gBQ1EgIoiDg3LmyLvCqGTCa0h9kJMG6UtVFhwDRenXjNQ5fLcn+H13vDQLL49glpac
         ENh4YbpyGYILeEWPu8b727o+Bg4hsOT692zlxXLYKxRqm29fs2XMCPZWIHtDsfxbhE06
         8jXnbSPd1hewVt4hhwtjwWPrrdln03z9PmJONfzrDwFH8xex/24/HaajPaZ8IJuNKHJK
         dibJ5iy86TMtsN9zaQbcvx0K9q3BwsueZL6nujfEa93MIVEbC3hxNI3YGgfO0kzy56Mf
         mWS8XSqp1U6ZwHNl9ARY9VomyaTHIga82SmeCyPTQc/ItcDFktbvAhhPfoN5Ir7egqrT
         Ndig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744430007; x=1745034807;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cCaU/9pItXeyQyKncm+hw9C0oW5ARKbMzPEkSk/lu0=;
        b=F2A+7ReK/vwHZaXtvzLt02ErNxDtJ4PqNprbMIjeOg+wTMuI7D+Y3UuH9Pk1iH06qI
         NTtB0UUEUR/avEKWb17vYXflzl+t3JTFb40XJy4dW/bJnA9YvsD0m4JIT88SGQjo1t4P
         TAW1Lr9dVER9PTg+C6oqxIqxCowJLQPqyg+Ua7uxYkKyi1jZgeISaMTFS4lmC/lTRnNE
         vkvEoO5pxZlkTYyKWThhyk0dD1ZRMy8puTEbnXzE8irHtmG4JeLwsphxJoDCZovTnIta
         AUhJ9KlT9PbQotptstMW4z4ftVymjkB9ayshQSXNc655tSSlBMeA84d8Us3sO2wMx/0S
         AAvw==
X-Forwarded-Encrypted: i=1; AJvYcCUqZNzzBmylBCYHRD1YKWWmpEPUlcFUasGEDYDGx0AC5Le9CS2ZQJhxBYVuVX9YqF2oS8RhUBEaCiPdlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzK3YQ9B54SIuLZOG/cnEdxGsFbKpTI91tdTftWhF6GLYHxb/tI
	3LtsPZ/jJLc+Ss3BdTLQA60lkBk7tqxI+egyPiKE4DtibcXoCLXq
X-Gm-Gg: ASbGncucCLYlmNK0RbzTkNlLQ0+BNgZCcy52To7urU3ysZYdU4vRQt5pnoULd3ytwZE
	a/2bIh2/MONX/wNW1P4bEfb1z91lZbXaxtVSTgqDhJcrm3ZpYyZknWAuKbGUkdhDWsrl2QBWuFk
	aMG93GvrTmMJrytVBGyZDOFsZ9YdCke2LLJeusWO53Sr6dnz2G+gacbzPNll6teLJUK5jT2iLQ1
	MmoBlh5PbUdtxolBp/Fx1iPExYlUKDW6sJfF1PL2fZDvXm5S4l54dcN4tJNROjcWwU8QHtToLYO
	oJ0vYNG7hdZP6TOG2vmbU8sFGc9am3rOWTITyZnVvuVw
X-Google-Smtp-Source: AGHT+IEIMF5fg8Rc1Bjc1V7Y1P75rom0e3KD+7LFsWsIXn/FP8KnbU+SQpMciMlE4vYfRTYAuGDRbQ==
X-Received: by 2002:a05:6a20:6f08:b0:1f3:1e5c:c655 with SMTP id adf61e73a8af0-201795227d9mr7520801637.6.1744430007203;
        Fri, 11 Apr 2025 20:53:27 -0700 (PDT)
Received: from [192.168.101.248] ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198c00sm2594765b3a.10.2025.04.11.20.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 20:53:26 -0700 (PDT)
Message-ID: <5084c2dc-d268-4268-a827-2ae445782a4e@gmail.com>
Date: Sat, 12 Apr 2025 03:53:08 +0300
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] Add support for A523 Thermal system
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li
 <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
References: <20250411003827.782544-1-iuncuim@gmail.com>
Content-Language: en-US
In-Reply-To: <20250411003827.782544-1-iuncuim@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/11/25 03:38, Mikhail Kalashnikov wrote:
> This patch series adds temperature sensor support for the Allwinner A523
> family of processors (same die with H728/A527/T527)

Based on 6.15-rc1 with dts patches from

https://lore.kernel.org/linux-sunxi/20250307005712.16828-1-andre.przywara@arm.com/T/#t

> Mikhail Kalashnikov (6):
>    thermal/drivers/sun8i: add gpadc clock
>    thermal/drivers/sun8i: replace devm_reset_control_get to shared
>    thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
>    arm64: dts: allwinner: A523: Add SID controller node
>    arm64: dts: allwinner: A523: Add thermal sensors and zones
>    dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
>
>   .../thermal/allwinner,sun8i-a83t-ths.yaml     |   5 +
>   .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 145 +++++++++++++++++
>   drivers/thermal/sun8i_thermal.c               | 154 +++++++++++++++++-
>   3 files changed, 300 insertions(+), 4 deletions(-)
>
