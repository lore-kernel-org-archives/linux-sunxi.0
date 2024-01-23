Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805A0F500
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 20:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706043509; cv=none; b=R0LQ/8aAG1qmj3swRsnTESOTUCbBC241OhrLoItvzd/sS37Uteo18A7sBYuyywnbKrSijPyjd92FME77NgYX821BnD2mcfvZJDOY8B6EvV9upFa+gKVkXnQ+Y7tlt7IEEr4wvUoe23D0ghog3xpauBAJD1JOwiRwdARE/isMSag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706043509; c=relaxed/simple;
	bh=S2q7c5fkB+kuMBms6LRjckdjZiaUkaGxP/jA/1mPeuA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3t7HQNDTA3IqkKgVgffOKtF8ifBJcTM5jgv3XBggV8DX3a04JTkc6+2joU9jU01I7tL+zFamVcvYlC36Yjx4xN0wo4ARWqlPtavKKN62Oc/qU5mAqvYS48lEYHzac2S6+YMb5ImVroPqdg8drtOovJK0hljb594IEmb/gVdTCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUdn51bo; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUdn51bo"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e7e2e04f0so52521665e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 12:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706043506; x=1706648306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FhzpM+Hbm13JKFnsdWrzrb1CjPr2WwviT4McrcRZJUY=;
        b=AUdn51boqN/BUQJHodLJ5D8s/5fit8ErtzDWP489JTKjG66le6yohlUcdJBoGi2Zcv
         gSs66rQmfiyTVdh+Zl6xHXl7D4T7TaxGKGUCjxo4ERs7TqOchl1QY5SJLGWQRs2GAaiZ
         hmanLKCcw13cZ4F2VhQsZxzdL+FwmS8Igku5L+OOVtDXdAyXoWRvGy5MZFAm7/9lFF26
         ynwI3srhUvDEi5j//L86iBy6hmQmgw8FR8lydMKmyV/4nIBWZtfkqiLvDuUhi7MrrqNk
         U1y/NXovoJpw6Lgolj8b7WiUb7faAbCKO66mT1ILrNBA/JzTdWru0N9MQoCMhinMBIlf
         ja/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706043506; x=1706648306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhzpM+Hbm13JKFnsdWrzrb1CjPr2WwviT4McrcRZJUY=;
        b=eXZd0VPRV6rUTQeQakKhoEudqXXnjfrsUHMNf41itpLKGgV78Gk6WA/hLNP33A/M1c
         a6B1U6JQPEyHFbUTf57gl+mjUjhlmQD1b3nrv3BG9q05/uDvtd6lcnCpanOkJXlQrteL
         cNNX6CPFwRjiKgzYO+IXAbRHqOkYO/PovQ3lUpDMAVHyCbKBBStA4QjUyc3XlFfLXLru
         Xidw7wjI2Edxb1+R1z3fPprcQDYVoozkltq4UKoCqCpzUHpzIAg780zhiDsDl6YGs128
         YfQp09BiuBh1/2HFbMWUO5oJOwHRDephK25hzooswKBXxZ+ho8AKFYfv433MsRcFI8u4
         Yq2Q==
X-Gm-Message-State: AOJu0YyqxvP2P0LNT/8iQPoQhvXLj9E6lqvX2PESew/DXzr5aFiIcAR7
	xzAxELzZ8yYq+XT+WkVZ5BEeqc6yZM9mDlGIXiM1Ht+q56afXl9c
X-Google-Smtp-Source: AGHT+IEmm+4oKlJo6i0ZDCB9QPPWXNn4anv1JK1yKEQ1E23x77g6/ibRSfN0RsoKbTSXENvc7dFing==
X-Received: by 2002:a1c:7702:0:b0:40e:7677:c25b with SMTP id t2-20020a1c7702000000b0040e7677c25bmr916470wmi.126.1706043505859;
        Tue, 23 Jan 2024 12:58:25 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c020800b0040e89ade83fsm402726wmi.1.2024.01.23.12.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 12:58:25 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Wei Xu <xuwei5@hisilicon.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 =?utf-8?B?6bqm5YGl5bu6?= <maijianzhang@allwinnertech.com>
Subject: Re: [PATCH v2] ARM: dts: sun8i: Open FETA40i-C regulator aldo1
Date: Tue, 23 Jan 2024 21:58:24 +0100
Message-ID: <23373941.6Emhk5qWAg@jernej-laptop>
In-Reply-To: <ZYqRZev1g_mztff2@debian.cyg>
References: <ZYqRZev1g_mztff2@debian.cyg>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne torek, 26. december 2023 ob 09:40:05 CET je Fuyao Kashizuku napisal(a):
> The USB PHY in the Allwinner R40 SoC seems to rely on voltage on the
> VCC-TVIN/OUT supply pins for proper operation, on top of its own supply
> voltage on VCC-USB. Without a 3.3V voltage supplied to VCC-TV*, USB
> operation becomes unstable and can result in disconnects.
> 
> The Forlinx FETA40i-C SoM connects both the VCC-TVOUT and VCC-TVIN pins
> to the ALDO1 rail of the PMIC, so we need to enable that rail for USB
> operation. Since there is no supply property in the DT bindings for
> the USB core, we need to always enable the regulator.
> 
> This fixes unstable USB operation on boards using the Forlinx FETA40i-C
> module.
> 
> Signed-off-by: Fuyao Kashizuku <fuyao@sjterm.com>

Merged, thanks!

Best regards,
Jernej


