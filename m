Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5741A3174
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Mar 2025 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741198001; cv=none; b=Rig+RJAZSt5Z0cd0AOuje3gGcnac72KJnQC/gxem2Q1WuO/vBWEYYqlaKAXlddlfwb8I/7sdbdpDD0YUulioK74HR81ODmS74F0Ed5V/QN4vLNN8LmKNVS/cjVm8bfr9ZTFO6uxaGXrtQRxqp4aHk+TUvYrSzUruNIaWHt8g/44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741198001; c=relaxed/simple;
	bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iVMoTS46A6IGnNBI1mqFT35B8YI3yTLARcX3+Mm/beaRDCFcJ5bCf5mey8xb74ZD/H32fD4ZGL4ofjzr74U+aqNZpMefBOHa2JGIP+cvDwfXBRnG4LQQOnL7AyKMXfzPj/Oq+hJGbTc3Uw0W9I3l4O76C80EFS7GQO1LsvMlkBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRTadeR5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRTadeR5"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-390eebcc371so3411079f8f.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Mar 2025 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741197998; x=1741802798; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=;
        b=YRTadeR5/gAa5UFpWV8nizP4Se/GgKXJmEXhFEu1in93ZKsaYDjRx5tHfzoCcb2TfN
         XnsEn4Um/cDHG5cZAH76N2t/2rsbVRLssZoPlzPgKLeqWs9lvjIdqFIYMWhtsEW8FcW9
         xpvBEpPGxK5QoFmQ6vHpZ6zu+XNkDefGY7nfbDevDZia46429po3fZ5jXKoThmHbOSwf
         WYbBMve71kaaFscwUsdPNARkuAxi5mfg54wp2ejMSdE7DmySpL8l+fgZyq0SbJ2NszkV
         2HvDn0r1WGO3gwnwYGkplIFSocyE/n4bJUZXoQRo7u6t2nz1e+OJwMqw+zqdAJDIdk1y
         MO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741197998; x=1741802798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQ3ImQocoFucBClygvcS1RhmiWw1E+iHsFgmdHPU/ew=;
        b=cmitWO1xxg/f3NAyLMR/tHeQlUPg5lIjv80ckdPzHZ2nJa/Z5Qsr9i/HyNnEkzAWAf
         B46E65WZKM+J+6BtZlnyleqt6mPrMmBhHcGiRsEWZzNMZ09ejI4vc4Q4+BPA/jRYl1Gj
         5/U9j+9lpVzYALxpraO8tRsgQ8KqwD/fWRzlRcxHFylUebHI57EllpQzSFJVOZJknNIQ
         ZvrHW6DGJ8e1DxUa7dj6T7sagAdfk5dc5x0/S7rDe9eWJgg3UrDSYmKuXdPHzagJDp+y
         t1YHhtK0EIrGXMGkazAASQAsMKcwApFdy3NiTmwZGtwztMIapmgESpW6Rmji6hr3upb/
         h9GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmu62sh4EUF0cE7mbZhQEl5HedpQojIIxLS47Xe1zFeJBK81aR5p2vVE1gzgtmPOCkY3+ZuhlCP5PE5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPh6sMsp38b087MRinoCBCZO1RBBlaHpMEZ0vUINkP0QxKWnjD
	03ptSrSRsN3wyKf8Hyyd27et6sPsSqWpMc5+ai0Y167H0cHuRiyu
X-Gm-Gg: ASbGncs3V9OWnILKhiE057VU77nAk/reO8EyxDjQ2gYYGFaPFokBWXaFZ9CkmiSTHJA
	syhJC/LICYe+U5WkAC7I4Bi8bzKoiDqIA+xa6MOAhVEf7Cx/6EMvnpZJzHY0JTH1IaKSdJvvfHs
	CmEpLW7z6UAuJgx3d7Rj7ViBiKJwXbvvjBusR4E8zkAjB1Q3AhCLXM6mknNHE3BByCXganHj6fg
	8i0DJJxaOXTaRLyAsSJ/qzYnxa1bS7gMIfftK7U6RnBeFTLZVLGvn35y5p445lpWYtP75cLsice
	AahYp/NXurHLM0zUxtehPL2m8giRou+lcjoGPDLUZAHABFL+4NVwxvHwLNSRKrQxel4Vkx6r+mi
	jt0gnMi4j/MdAQZ99ht/w
X-Google-Smtp-Source: AGHT+IG1tFvNWMKO6G6LFqagnscLlmftFC9LNAnPFI5pXvS1dut8feyFYZwx6Hi7jOMoJqthxyeJeQ==
X-Received: by 2002:a5d:64a4:0:b0:390:f641:d8bb with SMTP id ffacd0b85a97d-3911f7a9573mr3273237f8f.36.1741197997875;
        Wed, 05 Mar 2025 10:06:37 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4292f0bsm24542165e9.15.2025.03.05.10.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:06:37 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/8] pinctrl: sunxi: Add support for the Allwinner A523
Date: Wed, 05 Mar 2025 19:06:36 +0100
Message-ID: <1819482.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20250227231447.20161-8-andre.przywara@arm.com>
References:
 <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-8-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 28. februar 2025 ob 00:14:46 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> The Allwinner A523 contains pins in 10 out of the 11 possible pin banks;
> it just skips port A.
> Use the newly introduced DT based pinctrl driver to describe just the
> generic pinctrl properties, so advertise the number of pins per bank
> and the interrupt capabilities. The actual function/mux assignment is
> taken from the devicetree.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


