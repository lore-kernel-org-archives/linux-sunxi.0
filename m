Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4781FBE9B
	for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740221319; cv=none; b=sHZbS38yzpzB88U7owMotSJ4qP24WRnrfANNieErAWx4Fqzgoj9Ui8fIUjDBBgZS932BSBhrnECwL239p9RJYB2CrDe7cfMYh1736BY7NEEe29/3/qfW1F60FZSLOuGtIFG9BNThUO6eeuuyTdDgvCDIGsIqqMY57G0OzHvVkTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740221319; c=relaxed/simple;
	bh=f4Bw/JJH34S6WqqDPjmH5pwEvRSGU7yq69HeWIS5/4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=egdMXYvTwMXZZApXQnETwnXg+d4fbBUbumZIF3IabQLrB4b8bfJYuywkJ89/Q8Jc32+TTg3ImU0sXgbDbW9E2kcZxTwLxADhhnkJ9gupYXe6Gj40HgiUE0ctN3Iazy3h75+gTZrMKYO+pXMZa9mkpGRZJHG/aDSUpnWlfkknCI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HxdeYUqE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HxdeYUqE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38f3ac22948so1481450f8f.0
        for <linux-sunxi@lists.linux.dev>; Sat, 22 Feb 2025 02:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740221316; x=1740826116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4Bw/JJH34S6WqqDPjmH5pwEvRSGU7yq69HeWIS5/4k=;
        b=HxdeYUqEk+VhDo3aqlVlv3D2WFhnmElKXxAlw+mGIa3kQijw87ZI1+7irKodzS7a6D
         G7g0hS/AkfXzJM9IOw6J716mn0myxFe3W9xKdZWJNrEOCSxDHD3Fhv0ub7+9w2Twhc/K
         +70WGnzFERjd0jgheQAy2ZiZHVmhObxFZ53m0Qfxswh0CFzV4CmfY6QcFGuRpDef6YB9
         jK0Ia1l+2ql9GtQlO3p5qTQjXTiIKWuUXr+CypZMdei+pnmHklk3fULix050pn9aC3wR
         lltzVmKLljPhoISVWlX76Jkv3jctTuavi/29y8phCU+pdPBw/Fx17WBWqJflVWw8klNf
         vI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740221316; x=1740826116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f4Bw/JJH34S6WqqDPjmH5pwEvRSGU7yq69HeWIS5/4k=;
        b=uE6woFBDknLMYxePmvoeD0r02u0xin8gFx3NXNrC+l8/Gd6244wWO7LapwtfSgS/TR
         O75NbWo+o1NPnDNCqc8R7A/+noGA6HBbz9hKsgYfVYQ9u1mA/P08EZvB8ly5VnioIoe4
         0xoj4UN+ojDRKTEQO/6+rG/bwOnou449eI0YADE6HRV9O430i80baMAyAcnNUq2LsaSy
         1Sghg9rbyE+Um178jK5WE9MKLlzNbRoba8B68Q64q0SKNGqTkah9knqjWqw5moROAHhS
         7RLnxIIkgRSPooKthKpPVftjTBa0FTxpSolO/9OIzzaHlosQBA9KKsq8dOoVuSCh4TO1
         MSdw==
X-Gm-Message-State: AOJu0YyDR2XaLvoNqj3eR3Js3vCJIdE2tGRjDJX2zxHUc3BiLLxg2QoF
	ERzJFcsSnadjPGBvseoUa9ZYgekH5L6z+QaP4KIypXl+mRXbYgpGufSikgv2
X-Gm-Gg: ASbGncuZB/L7BLQda02ackvQ7QMZMNsKvFP9lQk10+rKZf52IsHCGqJE89rJskaOIPs
	CjlK4hxITbgTtjezQUYr58eSHcwJuaiORMKukwMMDVTZVVX3uI/hWbsSM2dU3MOW8AUdq4OiQ8Z
	T7DSO3N+4FfgC+URoiYUhwluw6q9v01ZmgerPu8YIX51i+wM4hjeorA+XA0cmckacBvUZh3Bl6r
	V85aLuHbR6ujS1SqvD691wtl70W9FmpA/O0QNxr2SOjybu1hYUBN+fI1Vhmm4Yo4S7Pj0Kfmp4Z
	sVmQID+h4r8DyUi3ctMBvzs1vuTsyVZ6QauN9q8oJnqQ/V9B4WiRv7zkde8fAfiBE1Y4yIUudB/
	jNA==
X-Google-Smtp-Source: AGHT+IHGb1ynqcv3I1Lqpb4WSdae1Gn6bKYqVXe+dHJe3J8zwqiVL/sjjSKDSwbxbZrGWdzbVBO7Rg==
X-Received: by 2002:a5d:6d8c:0:b0:385:ee40:2d88 with SMTP id ffacd0b85a97d-38f6e7565e1mr5843559f8f.3.1740221316419;
        Sat, 22 Feb 2025 02:48:36 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce735sm43140405e9.3.2025.02.22.02.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 02:48:35 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, samuel@sholland.org, wens@csie.org,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject:
 Re: [PATCH 4/4] arm64: dts: allwinner: h700: Add USB Host for RG35XX-H
Date: Sat, 22 Feb 2025 11:48:33 +0100
Message-ID: <870112230.0ifERbkFSE@jernej-laptop>
In-Reply-To: <20241018160617.157083-5-macroalpha82@gmail.com>
References:
 <20241018160617.157083-1-macroalpha82@gmail.com>
 <20241018160617.157083-5-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 18. oktober 2024 ob 18:06:17 Srednjeevropski standardni =C4=8Das=
 je Chris Morgan napisal(a):
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> The RG35XX-H has a USB host port in addition to the USB OTG port used
> for charging. The host port receives its power from two distinct GPIO
> controlled regulators.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


