Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ED21E51E0
	for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 19:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905622; cv=none; b=AMOQ9qi0kGDlpiGpTenel7Ye1iAWwZmd18o4gk1YCOhZT4LF9HAtVJ+qDPIXWcDMUQq0mpo/gJ54X3ZWtbXrQmXyLaoAMXjdJOS+J32/194BEiLX30E/fZCX9jvXokTBYeqTRslmtCBuLxBjrgdqANc6P6wu3tlb1seooG2e/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905622; c=relaxed/simple;
	bh=Hs/qnoFpXT5mzrFh3FYSbmqblVEDjKUtya7k9IFqpzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NrsZ343/I03dmdBz/srf/ULtTmsrGZ+4yjtyWdvkDMDt+XRZccBjT3W0PaK8xwTGOFiAC2nei9CQa37oxFcQslEyGLZzvxfPooHRFvYGEwVOKvZVseHq8h7y6Hb+HTYTT2h73j3SuR/j51cnPgL2eRTz6gbAvYhdHlNIz1OA1S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mR3oCRWU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mR3oCRWU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dd9b3419cso3157972f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 18 Feb 2025 11:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739905619; x=1740510419; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hs/qnoFpXT5mzrFh3FYSbmqblVEDjKUtya7k9IFqpzY=;
        b=mR3oCRWUpF/jWoW5LqqRx1aFFqk0HqRw0BBt2yMKhDU7WNv+191SzjBDKpN5/ftDuC
         Jic/FMNI7LTCCH8jcK2lAnE9B/aijfTLIrFVyf6zCZPWZUAFQ+3LM+TSPLfBHimALQzq
         fzWIzZVWS32pUSmABwKcOuWEwqHt/pam/9WjuJaAMAxY39pGh7JDs31DObx1a+YHNYg9
         Fpc2HBfVPNe0sZhUh0ap0mN+fRUUExGCb3Tk5vV/1E03WnvHf8asQYwKDJeQPPXsJsBM
         f0H46j/zGx7EEUiSc1/5xSNyZovhF9WfE7tcC87NQRYMHLkJ4aeocNlZ+MJtox6XQsiS
         KHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905619; x=1740510419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hs/qnoFpXT5mzrFh3FYSbmqblVEDjKUtya7k9IFqpzY=;
        b=AENsxAyneMVMFGbgRGT3g8YKBsaC5dyNur/4hYXXHbo/XZeTf4go+zFGfoLGj8Lr7O
         o1LabkzKQnUhXgo99GZj+jHO3nIFfr22SqpsY7cNL9FoeLsGmMaODHogHu5qSLou+sd2
         vA7Ndi6Lu9psUwVtMWCMDC8zrNmPwSDkp8/UAg2qVLLqoYISUyhk58wrE16W2oCVE+Od
         oVv7q0Ktm5ZJLuJCKVY/URhFeV4xn2q4f34OCb7wXXntre73YmS+Cbo2+J36lpf4vX+6
         OIva6EUwGcV/5jkQzDU+AugkEtvRqZXEQN+ainBiWzpIU0xFDqK4PV63rvgLWNEoH5eN
         sb9g==
X-Forwarded-Encrypted: i=1; AJvYcCUXpCI4Cp1vFoXWsyoQ1qA1rpPuGX7gz9HbkhisyW95owMxwbuPtlDyUBvaRhjhgrE6vgBItMlWXUxLYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTnTajEiDqLWWzNlTpbYvgo8/WOYBD1GNSepOviMVtswoQSHlp
	KgixgY5E3pnjulYLIVbvjmrkPXMJmyjQVCVKNBLCyfJHXgqq5UbC
X-Gm-Gg: ASbGnctaTB0gsCYsLohxtgclVMxG4yWFp6Kvk/TpYmyc1TlD33C0P4LhIL9D5d90Z2L
	IroTsG3d3uX0cEvKCK5kEOG3JxC+0EI6In7wUL0aoB4AhzVwuPXhPpSrDa9kkXgD65S0F2pnWBS
	bPc7D5LUc2FcM8SRFYKJQQTrpEsQ/lR/wLWSH67fqJQ4gKGeKmJR24Vt/FcD9i4tFPLYTyssOKc
	mz+4Px0rNzGVpHPhcFGXwvBq4bq1KagA0OzUhR2pxuX78ExZgVU/fkVyx2mRA9B3JczY60/y48I
	R3FIfeo5EgDLwU2HCaRC6MV0naWA2eDZ46QWNrGFyE0Z8asz8NCNYI7xa97hKg1ywq4=
X-Google-Smtp-Source: AGHT+IE4Ztj3fqoFCu3fT1sr18ZtU3QldzSJQ2PYy4jRgkP/zHxGfnGiNxC0aElqmtmZKg2tXOMIXA==
X-Received: by 2002:a5d:6481:0:b0:38f:31fe:6d23 with SMTP id ffacd0b85a97d-38f33f2e91cmr13677516f8f.23.1739905619006;
        Tue, 18 Feb 2025 11:06:59 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43991c84fa4sm36268225e9.39.2025.02.18.11.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:06:58 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/15] clk: sunxi-ng: a523: Add support for bus clocks
Date: Tue, 18 Feb 2025 20:06:56 +0100
Message-ID: <10610758.nUPlyArG6x@jernej-laptop>
In-Reply-To: <20250214125359.5204-7-andre.przywara@arm.com>
References:
 <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-7-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 14. februar 2025 ob 13:53:50 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the basic bus clocks for the Allwinner A523 and T527 SoCs.
> This covers the AHB, APB0 and APB1 clocks. Linux is not supposed to
> change those clocks, but they are needed as parents for many other mod
> clocks.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


