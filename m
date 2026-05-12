Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414633BB661
	for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 16:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601613; cv=none; b=uW8WxIZsIzqeiKW/5RPIiCtISqUoBR+RU3LvseHrt+qHMoqkJFUbVMiA2GXkd5EqMDLaDJZHM/tcpTCAEx1hObwc2er/PeUJB1ZRFa7h+a3NXKZ93qX+jcwxavsYzcKEbJG1zRPierwyW+Xa41ckA2xhDE3eJ+YuzTjZjQNo1PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601613; c=relaxed/simple;
	bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3zG1hxcspfiDOJOz6saOzEwaWPHGBSd2tZskKvyir9HV/Qigslqso32s+x+0xY/IGeHwaq9SGS+RoLec0FNVAHMymByop4yMTK9yRzIpuSsVOyaRUjDUXgbqG6onCBb9QrBNHrS045rcLYGRkHiM+Ejnfppx0pUEKsRCRcHthQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmbTs43G; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmbTs43G"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso51181175e9.1
        for <linux-sunxi@lists.linux.dev>; Tue, 12 May 2026 09:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778601611; x=1779206411; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=;
        b=kmbTs43GtJiJmqGJFExvNUtaeMaLd8QYKE1gbPCYeeyuXdtJkO4J3j7nYs3roJop59
         Hi9wDTZ+Wg34zin6IquvU2YowgQIXZScsJzJN7d4iwHRqzlgBUD3koCUzayuwlhKN0Cb
         DBDIFvLoiVd87Efj82gXR8n/QLhm0dR33tVRCC7maO79W1gKSnNyxjlt9Zb+5/2b0ITB
         wuo/+y/ljUjgBDeocWzQkJAt1TYGnv2FDT0/8mLB4loEoI6b4kHjfNwE+KeR2+9M2rWH
         SaNCJse0GRQxdwkls3iJwNPf5gGUFIB5qVeXCNg2nwiybHGO+Hr/2u9XQK5JGd+uvp7D
         pruA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601611; x=1779206411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GMlWUewpnO5BHrxePkEK12VmSLLS4fX3PTW9+WOgwyc=;
        b=YwMPICZj01/hToqoCEZ/JzPMP77RIgZQMBPS6CMVJzCwxgOgQealQcUKks9vW4s5In
         tgoEykhO33/42ajR+I2bns89lhjrYGzSeIZG64IJGDnkMD7nKD/DuPpJPmAIbHhoNJJo
         0s5nV8DUVNBUWN0IX/uFt9ph+heFewNhZ7tnkqn5PBaKPmFo62ZnBR229ay9mRfvadXc
         W3AjLXDiikcHCsranMrqhlAiRzR0WsWlAzkCWF1E0CILTGrICFVTX/f/6turllG6Gz5+
         wIVy5UJlnhi7xiA8kkNLiuAyVbaYCVBcTJJqvLPG7lMOdCSaUX6bDSClGMwvWQS7pxYj
         AGig==
X-Forwarded-Encrypted: i=1; AFNElJ+3qgzYkxPtWaeiBTDdm8ts756Bu+l8v0Lb2yZOrnovsFHG1sr2++vaLWMNLE0OpwT38Ck+JSzy/aeGPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNjoamBcgsIkUKwAB49EP5URJzdgn95LSIbOvHuAAIktgXxW9b
	oOiEjsybRwmdlO6BTCYqAEj5V8Zxyd8hvIt8f4buLSW6bppk/w2UJ8qH
X-Gm-Gg: Acq92OGLxE4S0/CKGnaIrtKKjVlHciVMl9h6AYjM6GWOVt5mjFdlZns1xb75B6Fx0xL
	DztNvHBaOJ6o0m+DGKcDVyh55SCcnWJl8+vBl9ArO2PSQi2CqcKxRtzO6mo1wX+t2uD0BG+Ey0c
	kBRgF0DgWGKRi4qI24+O+IDJTrzjnHkupDXdpZ+RmM9nkoPN3PTj2AG7XaVdf20bn1vBWEw3edD
	ykQ/L6qkZPpSdaBzc3Kh9SH5yOPjUB7ScABuUnLViU/osqg0O18BaNDzN2b825PI9S4mS9x8gSx
	xuxMBMFlykgFZTyuNwGI+KCfdAU7e6LCSzhMx4MDCeMwK4CfY3snyZQYzuGr1mOGL1DXT33dRQk
	mROryFcisq5PYIwYhr8hg7Ty0PB3+WBb87r4v6k8vVHih0ztnf9QFJga1yTxzWjmKZIBe11vv5x
	/faf3FNRwzjx/QQyndM0dr9FPv7NhyaSSR0Br75HxFYaa065dTwfJ3iaTs0GhbV7DXuwzX6U5+C
	NpZjRCo
X-Received: by 2002:a05:600c:c166:b0:48e:8499:4bda with SMTP id 5b1f17b1804b1-48e8fe732c5mr56263285e9.13.1778601610271;
        Tue, 12 May 2026 09:00:10 -0700 (PDT)
Received: from jernej-laptop.localnet (46-150-62-216.dynamic.telemach.net. [46.150.62.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e913469besm14404775e9.14.2026.05.12.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:00:09 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] arm64: dts: allwinner: Cubie A5E: enable SPI flash
Date: Tue, 12 May 2026 18:00:08 +0200
Message-ID: <cjl1U0d5TU-5Dhz5uRAUHg@gmail.com>
In-Reply-To: <20260511221741.25888-1-andre.przywara@arm.com>
References: <20260511221741.25888-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 12. maj 2026 ob 00:17:41 Srednjeevropski poletni =C4=8Das je And=
re Przywara napisal(a):
> The Cubie A5E board comes with 16MiB of SPI NOR flash.
>=20
> Enable the SPI0 DT node and describe the configuration.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


