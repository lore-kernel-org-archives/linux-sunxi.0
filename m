Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499BB3E47F
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Apr 2024 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714224284; cv=none; b=lly3UckoIg6MErLapZjMtVdHQKeSzL90HowFQsb9hxbySh0RKP2pu/JabP7+uTJxsXATZPPg1ejAe7u/nHZ9zmk9UkYPTcI7XBylDQUkwrImARwhEsvN7x89ZtL5xSDD/R7fXSi7GcRe9lKWIh7NkB7kaJOnr3JDdXhIzcPxSek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714224284; c=relaxed/simple;
	bh=6pdt+T8bpD1MDg0TA6iWRgozMYW2wNvimQanYEUaB1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+i15gHNMNKKSfTV0gAjji/wBC+lEQLDNxzg7iRvi/vn1PwoiqJx6OFwYvk4HZPKnn4JPcny2AJ1VBuhsMRAg5VDWxoPyilk0y+MgAqWLud9SwyfAnKKMJLAgSJXyZEFDPvI6Sr7OjUUAmqfY7GBoDEVDbC+X672ld2MqZMFjA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeJxGM7y; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeJxGM7y"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3476dcd9c46so2349350f8f.0
        for <linux-sunxi@lists.linux.dev>; Sat, 27 Apr 2024 06:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714224280; x=1714829080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whVmypuOpLk7I4u5rt/r4BWdd+BmAj46VZDNr5x9rv0=;
        b=ZeJxGM7ysZNOxsmFfuWrnQi8jCVpe6h0dthHUr1zY+BZrcmg15YA8qPysR7y7ipARF
         5vEqm/R94Fka4mH+S1OKPBs1J1cCpVLOJLV+Hk3aXtmQw+FFsw4hgnngtcb6HU2PkIXe
         SthRpgdXhzSIer8L2uVoFjF4I5ezNIVrAMh2TO5Hh09wTbuTQ/+XWaIOA/pmNruDjVZT
         jOpIDUAwi4Su3tB0LT9rFGLG0vMaWSTe8riMk/a/RyoOLX3bMlxZGN0V8kFUbVdzKVcS
         tmTzit7pDQk1KCnEvER5hBles6IQ0HIB3YfXZtjKmCdgacz1JgkDbxF96NwoklWrf7Op
         lxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714224280; x=1714829080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whVmypuOpLk7I4u5rt/r4BWdd+BmAj46VZDNr5x9rv0=;
        b=T4i0qNzKYmdI64WBklsATBqWwlATlX4L9mnyqOBPfjssAvkO5ez3COKkswvpEFZN41
         dP0FSPUGYdtTO8wPzo6GFOG8p4YAtngh/o+jSQ0kK0HPgKYR1PHAFgiNLjs1mPThDXzU
         szVIHSwPTFK/lNcHLv5GBq0Z4QwuChWtOpAsryj3jPbmDP4c8r9Lq36U0kqFxonACpVM
         GGLTCMNirpHyD3G0pe1nMDpHfGKjnwd7VnsjARl0HAUS+T2zTr6Mvu3AnCGnIIauWV8Y
         brH08wbYVLgSbrsESIv92IzTyN2t+ZQsK8dv581PPKhL5a9yAH/QPRACcNWhqWNaSoG9
         wZlA==
X-Forwarded-Encrypted: i=1; AJvYcCX5ahT8kKNixa5KWivZ3LNt3FIk/33Dhalqx4GxkVhq696ohrpIEF66n+r+JFaHOfbOWtecKBNXWNTFHPK5GHiEpddzuLa6F8T5CHE=
X-Gm-Message-State: AOJu0Yzdfk8RO6Eqb0JHrxrYDPlCgoSj8KeaFm6x7c5gWVEmdBzDDqhK
	YhFHgulbHUbVBF6hGZ+eQDDW84rOu5QBmEb8hoFR665alPKoMItP
X-Google-Smtp-Source: AGHT+IF9veGmn5mWc7/pnlDQ2Q+jyxBIhhiU5FYMdBkgYjxlDRD83RgzEs+g1eI4UrqQvNDoU4kdWQ==
X-Received: by 2002:adf:e104:0:b0:33e:c924:5486 with SMTP id t4-20020adfe104000000b0033ec9245486mr3780495wrz.46.1714224280364;
        Sat, 27 Apr 2024 06:24:40 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id d9-20020adfe2c9000000b00349a5b8eba6sm24999482wrj.34.2024.04.27.06.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 06:24:40 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chris Morgan <macromorgan@hotmail.com>, Ryan Walklin <ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Ryan Walklin <ryan@testtoast.com>
Subject:
 Re: [PATCH v6 0/4] arm64: dts: allwinner: Add Anbernic RG35XX (Plus/H/2024)
 support
Date: Sat, 27 Apr 2024 15:24:38 +0200
Message-ID: <2385425.NG923GbCHz@jernej-laptop>
In-Reply-To: <20240427110225.727472-2-ryan@testtoast.com>
References: <20240427110225.727472-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Dne sobota, 27. april 2024 ob 13:02:22 GMT +2 je Ryan Walklin napisal(a):
> Further revision with a further few small formatting fixes. Major v5..v6 change is removal of the SD2 card node, given the requirements for low-voltage signalling are not fully elucidated and 3.3v operation, although working, was reliant on incorrect regulator node definitions.
> 
> Original cover below.
> --
> 
> The Anbernic RG35XX is a family of handheld gaming devices. There are 4 variants, of which 3 using the Allwinner H700 chip are covered by this patchset. The fourth (released first and named simply RG35XX) uses an Actions Semiconductor ATM7039s which is a 32-bit Cortex-A9 chip with no mainline support and is not covered.
> 
> Common features (RG35XX-2024):
> - Allwinner H700 @ 1.5GHz (H616 variant exposing RGB LCD and NMI pins, with 4x Cortex-A53 Cores and a Mali G31 GPU)
> - 1 GB LPDDR4 DRAM
> - AXP717 PMIC (patches accepted in mfd-next [1])
> - 3.5" 640x480 RGB LCD
> - Mini-HDMI, 3.5mm audio jack, mono speaker, two microSD slots and USB-C (USB 2.0) for power.
> 
> RG35XX-Plus adds:
> - RTL8821CS SDIO Wifi/BT chip
> 
> RG35XX-H (Horizontal form-factor) adds:
> - RTL8821CS SDIO Wifi/BT chip
> - Two analog thumbsticks
> - Second USB-C port
> - Stereo speaker
> 
> Patch 1 adds the DT bindings for the board names, Patch 2 adds the -2024 device as a common base, Patch 3 adds Wifi/BT support for the -Plus (and -H), and Patch 3 adds the second USB and thumbsticks for the -H. The -H is a strict superset of the -Plus, which is in turn a strict superset of the -2024, so this translates quite neatly.
> 
> LCD, HDMI, audio, and GPU support are not yet ready and relying on out-of-tree patches currently, so will be added once these drivers are mainlined.
> 
> Ryan
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Merged, thanks!

Best regards,
Jernej

> 
> Ryan Walklin (4):
>   dt-bindings: arm: sunxi: document Anbernic RG35XX handheld gaming
>     device variants
>   arm64: dts: allwinner: h700: Add RG35XX 2024 DTS
>   arm64: dts: allwinner: h700: Add RG35XX-Plus DTS
>   arm64: dts: allwinner: h700: Add RG35XX-H DTS
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |  15 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   3 +
>  .../sun50i-h700-anbernic-rg35xx-2024.dts      | 327 ++++++++++++++++++
>  .../sun50i-h700-anbernic-rg35xx-h.dts         |  36 ++
>  .../sun50i-h700-anbernic-rg35xx-plus.dts      |  53 +++
>  5 files changed, 434 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dts
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dts
> 
> 




