Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9A33032B
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771666806; cv=none; b=gj8SmUM4rvuDuqyLW32tRRKhKN+qCSO16WXSa2IVHgV3bWOAleBpHH6OkufADePgCInAh7D7Lk9IYyWlHXOFy9HipBT1Xa3gFxrpbBincl0iNE3uTJichI0uQ/TsyCffMDItG/8mlDeHIs/YxQUxF8HNAA92g39Ky+VotxqNgu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771666806; c=relaxed/simple;
	bh=g6/9TKO3LWYFd625WXu9vJ/ajbVGHAvhA19sJ/yb0fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VA1hUmXbkOuKPfOldVmvnl1EoROzJh7NHq33fH52glXxopPCPbmRxxrUQd+VwnYQy2Lg5KT+534iSUtzIKpPOEzz5HqEDm+myR6T6ZsPDonQTv8gylvzLeUcuoE/iY6hG9cU6heWFwDRrFW0wCsAF1RZB7TPRzv7RYn58yhpHHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5W9H3V9; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5W9H3V9"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so16514915e9.3
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 01:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666804; x=1772271604; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6/9TKO3LWYFd625WXu9vJ/ajbVGHAvhA19sJ/yb0fs=;
        b=F5W9H3V97ktnOO+SS0ElQ+3lzm+vWkI7tVCcpQ7dd2iReDOIVY9rQ34CTa3BgaQMPb
         NNnaSVw386o03zBMekvm9sbwNqeB6YZESc9lRllO/CntD9O0I+3li9myBOvB3oad/zQa
         aVT15NpEfXCqjt/mU9kd7HCDo1E76lyBpCMGN48CwAMizgrZmiKi2EIzysuGzSRus5wQ
         XDB1MXqzCXfQ1TqMe0E9PSu9erCLvLyj8Fa65Ak7dflE2w8GTUYGs0DAwUxpQyOzvXR/
         PBL7FGxlsSHtcQCc3AFzxfM/F/37BzPQgmc2p9UWYI7HpDP1b3ITvJ6EMjw4VE0sGOkd
         xyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666804; x=1772271604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6/9TKO3LWYFd625WXu9vJ/ajbVGHAvhA19sJ/yb0fs=;
        b=Bzke7F66J/KvAM6e43AJ6lTIQeSrzNyHmzcVqt6bIlcUG/0taHi/WjAsHmgsxCfFLm
         0bN18iK+tZ2nLxhYsOqtyEENg3OapaqTtHXi6pxUWr7dC41IowtPRgBM+dyJGw/vw5o2
         6kAiMe/9mBWgqS4/i0PGm3P/xVp5TRYvk+YQIIwIxAiCBFHeAczv2MHmW5/rmpaDW6qK
         BgB/RZnXTavsahD8m41lwX58OkXdPB1yv7CFdcoaED3YCCisgs0mjM4FeQRUn5jpXJAa
         rD0XCw7Da7v2KeAICwz8ZSLQYcC2PHithIGtLGSLdqyxH7EQA6vnA2Kyhlg1p/Rp2OdF
         lDgA==
X-Forwarded-Encrypted: i=1; AJvYcCVaXjhJN+8hucNrswj+ffFFd7ACURADpfF4uYS50xKT+5gmTOqI+/naLwGVnYhcOorbpK+Mga+r7Qh80A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcXjAlt3RrvYXnHXhUCTQ3eyV4cJptyrWlDkD2A+aF1OOoDPhh
	vf6ptCa+yeXintDog4Nep0dpcU1O6XIGDllhF2I7jWYiXTsy8DnZoSHT
X-Gm-Gg: AZuq6aK32OnZNaNLeejVh7ez31eOllRajhRE/YJe8NmwYydIMOTqjQxhIe7DI19KIE2
	sk0c1z5K3mRUU64FEVs6Xx82CmaYGjnPbSWYq59soiES0zKl0DzPTyP+Uzex1DEbdjEMqBIpIXx
	LeeHk7z69Dndm2p2cx1glixlKrCDK/2JlRjs3VLo6Kj1Q47RmMA+O67rB7a49big873Tc1MnuOa
	Bn+9BIVE1EneDU4EQUgnbeByYucxmHAAcBz2M25/0CrSeFAMQkac/yEQMxQ40+2W1CryCm1OUAr
	KIvSbvRDE/DcxIOtLrZLdn8Xuy85F9UUjfBH3GRvvO8wx6ygq5+gdxtEcGo/XUoN4LpmzN0xC91
	lSDJzeR+/jt3FgeJONnrmIv5kdTnKOobm9h9qtwtn+4ga0Si//sXBtM1yZmK4pfKcRiI2Tw9U9Z
	R+1wZB/qus961B/fPx95VP4SA8L1P729BtPnGm7muC2HTX3ysrt0Y7p49dVC5d3ZN99Wm41NwTF
	WP8XG2t
X-Received: by 2002:a05:600c:46c9:b0:483:a21:774c with SMTP id 5b1f17b1804b1-483a95eab7cmr39989255e9.25.1771666803563;
        Sat, 21 Feb 2026 01:40:03 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a316eb08sm143975255e9.0.2026.02.21.01.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Richard Genoud <richard.genoud@bootlin.com>
Subject:
 Re: [PATCH 5/6] mtd: rawnand: sunxi: make the code mode self-explanatory
Date: Sat, 21 Feb 2026 10:33:01 +0100
Message-ID: <3396446.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20260220161011.999642-6-richard.genoud@bootlin.com>
References:
 <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-6-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 20. februar 2026 ob 17:10:10 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> In sunxi_nfc_hw_ecc_{read,write}_chunk(), the ECC step was force to 0,
> the reason is not trivial to get when reading the code.
>=20
> The explanation is that, from the NAND flash controller perspective, we
> are indeed at step 0 for user data length and ECC errors.
>=20
> Just add a const value with an explanation to clarify things.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


