Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55322204F94
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069764; cv=none; b=Mpjr9uL8E4NEUoaeQvTS/R7qwCySKx3ju807uIIW0QLqMyYvda/77g+Y4Vq4niGgP3S4TViDSQuZ259xDzLLOefq9bw/LABcL9YLMuM7kpTjKkxV0qzYlBfAsCK2CEJVg6++GdvVLdUR4iL5XK1k0K39vhwsYW6uju4XwgWPkEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069764; c=relaxed/simple;
	bh=Spb5DN7Z957auhFhK10W01ysEwluGPWuq85ZNm+0g8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uRaJWnwcmyNtXb6pYulYcoQASv7lOWt6gCaA1xy8QVIv3uTqbZZ6nyY8pPtH/+H3Mc4yXqDkGvMUVn3idgRd7M6wFZYdpZSzaA2c7aKabLpJJ5UeSlzskqKii4iMFeXGr73S8Z8HgCnzVJ54G5JFkN3yUlgsFPfNmaPDB2avoOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSqmA7B0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSqmA7B0"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38f3ee8a119so623967f8f.0
        for <linux-sunxi@lists.linux.dev>; Thu, 20 Feb 2025 08:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740069760; x=1740674560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Spb5DN7Z957auhFhK10W01ysEwluGPWuq85ZNm+0g8Q=;
        b=XSqmA7B0RPvYCRTX+3NeG/QrPTGfD0Jn4//uH35JCiF5Ch9at4UHWbwngXKSnpTKX1
         8cjiWs3Xa8GISJuwQ7b0pb67yCLNnoP6y6aiduVaMjrjhb03drWLwA5BrVpz/n8vb3dU
         xTLhZtC+2cC6bRnMisBE50Z+GEBkOgmxSBgmele+xUABnO39jbJ4lcie+pB6EnVZq9Sk
         /GdeqCfN2vi3WLJ4AtJE2xwYDt0aM9OCY1w4tNe/nLqoxSOvRsaUsGPKpsucamCP4Lfv
         F4hROZcKuduylEGjErw1iirTRzYZOVivllojzEhqPQn8dB2ANE6dNXiT1CCSsQS04Wkl
         oGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740069760; x=1740674560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Spb5DN7Z957auhFhK10W01ysEwluGPWuq85ZNm+0g8Q=;
        b=Y2/tqtohIfbTOqYj9h/QU2THTDPSXZ+j8lTgZ6W8zS4K/j94gzTDF25ZW8suhCEp+Z
         QqsA3jhQMwjsZlGlxSzF56zhtejzRu3o3Rf17JB6/uRQgg25yX7TuEYjHmgIXLKuqIeV
         h2t7fkjr2LR52EPrC77+GQEy/1B5A1ASfX46gU8K/g0fBLOFIDpTTUweeMIstB0btDqK
         4+xEodgKYasOKh3cuiGO5C9lOjD6AboGKv0GdHQunaxAusPQ3zkVLtxqG55A+Qr2ywRd
         h3LNjO+X9ls3VRl7Bx3y+JEKEy81ji08vrvfrbHFlLYv89VIEeMTYYFtZEtxQNdM3VmW
         D2Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXvIMXmXOmYS5yEZi/sW7veCMdzOKXDVhGRwuFbYLzBSq1OEOrkQG1xw1Y8KqxBs7Wq8whbafg0ta9IYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGygarfyPnAEPlP6Cd+m9xoWbVx4S7BKB9SHm6A0WqxbODbymV
	VSX555A6rG2Waf59FF3MPgdUAcosYqSilMfpa082BS21XjBpqCX4
X-Gm-Gg: ASbGncvdvscplWcOdtMJaK/yPguFuKiilqn2T1Gd5i1zq9Tf86HXal1ZcZe9mIbpPxw
	0r01YYzbJnDSKpYKnhCAgMIPysbkSWNIzg94MOueQFawKAo5rNu5EzAVLgJkjABxNtehpzCB+5i
	qAN05fwj0a+39tkovpFWsBEECsZchuHwopuSLMXv9PdbpaNE1xNs178FFR4XZdw3t5f4/yG3iqe
	aAOJegt794ChReyGfEo9Tc2SXvnVUmOOoiIkZlAvVpCHSt/pOu7A8fFJJUMJuqDEWYFUtlzzYK6
	56dqN7+y2lwuO57xQAgQNW6gmCpnB9aKfc1KTCu9ei8XAKiuihYYwaaH6gUINlTb1K0=
X-Google-Smtp-Source: AGHT+IHKAPnHG28kS2PXP8ZMEI3ZDWU7Yq8EPs8z2/DhkZ5Cc4K6VvdHC46lFrkP+dx+zXRT0tV7pg==
X-Received: by 2002:a05:6000:4025:b0:38f:4176:7c25 with SMTP id ffacd0b85a97d-38f41768063mr14903972f8f.2.1740069760495;
        Thu, 20 Feb 2025 08:42:40 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5c29sm21139863f8f.72.2025.02.20.08.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:42:40 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Aleksandr Shubin <privatesub2@gmail.com>
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>, Cheo Fusi <fusibrandon13@gmail.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 3/3] riscv: dts: allwinner: d1: Add pwm node
Date: Thu, 20 Feb 2025 17:42:38 +0100
Message-ID: <3688166.hdfAi7Kttb@jernej-laptop>
In-Reply-To: <20250213094018.134081-4-privatesub2@gmail.com>
References:
 <20250213094018.134081-1-privatesub2@gmail.com>
 <20250213094018.134081-4-privatesub2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 13. februar 2025 ob 10:40:14 Srednjeevropski standardni =
=C4=8Das je Aleksandr Shubin napisal(a):
> D1 and T113s contain a pwm controller with 8 channels.
> This controller is supported by the sun20i-pwm driver.
>=20
> Add a device tree node for it.
>=20
> Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


