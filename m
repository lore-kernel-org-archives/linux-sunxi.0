Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CE6343D75
	for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771666811; cv=none; b=LDi+ZBJ8wwoPQqh/881ajqM5F1+VoVOlqiE4gNJ+MTxe/8PZ1cuX54tK83CX1I7XxW4Pgu+ZaL1+0zX7Wj+Kb/MtfQxMzhA1XfhtDuURqu7/ysCL7YlY7ZOKRJdbtHg2E2qCNYYdwcC0U/8pryQ8SX2tqEDOGjTnUxMFssHoQM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771666811; c=relaxed/simple;
	bh=X2dvvtP0QHY/bsWx4Eesgw3WQJgKi927oam26nArPGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uWv4qG63wLrb/MuuQQnF4WUmvMh4T+BKkML8hbAG6QpJfMcGh1zBHmZoh3PTgHntQgD3SvttoK/03FBWOghibTWLPBAjkgUvhOQ2O+GDWwTs4C/sFrw0EQKsfjBFvDF+9Iu4VDPNy9Lp1pi9I1UcwajxSuQE9kSfd6ZRpnqB9E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAfnlsMY; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAfnlsMY"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4376acce52eso1737784f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 21 Feb 2026 01:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771666808; x=1772271608; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2dvvtP0QHY/bsWx4Eesgw3WQJgKi927oam26nArPGM=;
        b=MAfnlsMYp0PUurbIAx6LRivW/h/L7RlWouyEJvdP8odPxmi6qFNHOkMhWovJgVHTn8
         oP0tk26Zb52GHkFESCrC+jBqBQ0oGR4kISVxckkqvUUdRRmkLuLry8yP37hJEdnXTgAu
         R2Dtu7jkDsug1TcAJXmWFvi4Zh7pZPzchxNUecyu4uH/3oyGHZ1hWs270aIN8AqBI0sE
         eKUAcf7hX7tnzqucbTtlDlikaNn/Z00vu1xKy2Tj6u4AmZatFQ8iNgLl/Svs8ah0SflJ
         O9NCsBzh2VgZ5OcE/97RbkkQsU6R2YnIrcXlFQbyxkMM6vPRiUkI3P+XiKzGyaLP4FRg
         Rl0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771666808; x=1772271608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X2dvvtP0QHY/bsWx4Eesgw3WQJgKi927oam26nArPGM=;
        b=IHUsfG3bM0j0n3qkDiJqWQDCSeyD9EsFvz13dzWpFB5dbD6dDjbD86JjKfkuaLv2f1
         9z+nzfeYDi5CTVd4C5Nje/ZO+mJApD+cAEIKdjZTgm6QqNukJS3EAviZZ3/jFx7MaVdy
         XzrmC/yn929KLDtVY0kYsFGiUR4xcTAk+3r9OoE98fLwQ8/NFYBT9tHJNkJrXbt6ID+X
         Tj55dH7FhxLUEGOS6VqHQz//V6/DnhtAELjDiYWysvkV8fCTvI38X5U6xjyucrOC0YBv
         2n/JP4pCRFZEyNeHp4h14kZj8JAKWUOiopVC7S3v+ug+ZOHBW5PtjZ0igQoOBs5IHksm
         FBVg==
X-Forwarded-Encrypted: i=1; AJvYcCVZXup3ZBid4m5kB12O3mIweZIre1IjRvm5YVmdCO/2eYhmEGJAzrey+yaQmSuAfweT0efATj6DR+BVtA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzReYt5gIBu99llWrSkdAIo5OiBuWZ4ZPsySt/eSUK5eWH2VDvX
	lH1ElIigUKp4FqePoZH498Wm8KaQUKmgiPgzX91CpZ4zYCQGryn0/oKm
X-Gm-Gg: AZuq6aLCc9TqqoYfKI2ZVqg/9mFxZsV5Pb4kd+bztvUpUiNG6SoADbTFkiMtO311ckX
	xDWxZNMR4gZgGIr9qSvnAti002USYlF2ykqjO1D1dHINxdDBv0jgrgZv+LoMhIDZJfkaoheIslN
	OIE6+/j8g+LCRy+ffGJeHtq91eOtfyibSotXPydVDO7pTyG2fD0vxkGbVskb950HxShg/tyuxJ2
	vI8SR+5hYtD90nAIsYQCqOczgMeHbwWoLFAtj14iXe41ajp9Gfh/g7diSXT6Ld9rXr2orcFB3jL
	1jS4PW0oJUVUr9r91T3g/e9nGk+SKPW23/M6MNhxweN8mjOlDRVA1KAfs2SDF2/yvCs4kBaccG8
	L4Ab94gUX6yjs66B6VR6hT2MAgyMwcVLIb4l/3tI/LVufHRBjiPg0Av9meq840CeH2q9gNUzxeN
	sUV2lPuLY8sYNP7ew1CR9Np7xCCADt3jaTZl2Se/O9MYltCmX3ERJ+qFTT2eMjUM6VWo3d0rdvV
	VqJvVxZCrul8IXRuA==
X-Received: by 2002:a05:6000:604:b0:435:8ad8:b7a with SMTP id ffacd0b85a97d-4396f181362mr4957590f8f.46.1771666808395;
        Sat, 21 Feb 2026 01:40:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm4555030f8f.25.2026.02.21.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 01:40:08 -0800 (PST)
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
 Re: [PATCH 2/6] mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
Date: Sat, 21 Feb 2026 10:15:56 +0100
Message-ID: <5078855.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260220161011.999642-3-richard.genoud@bootlin.com>
References:
 <20260220161011.999642-1-richard.genoud@bootlin.com>
 <20260220161011.999642-3-richard.genoud@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 20. februar 2026 ob 17:10:07 Srednjeevropski standardni =C4=8Das=
 je Richard Genoud napisal(a):
> When dumping the OOB, the bytes at the end where actually copied from
> the beginning of the OOB instead of current_offset.
>=20
> That leads to something like:
> OOB: ff ff ff ff ff ff ff ff ea 19 00 3a 83 db aa 8d
> OOB: 99 09 c8 9a 90 36 35 7d aa 15 13 07 3d 97 b2 a4
> OOB: a8 bb 19 b3 07 e9 f6 25 52 d7 1a 23 e2 7e 0a e4
> OOB: 52 8a 09 d2 1a 86 3d cf b4 99 43 13 d3 90 33 0b
> OOB: ff ff ff ff ff ff ff ff ea 19 00 3a 83 db aa 8d
> OOB: 99 09 c8 9a 90 36 35 7d aa 15 13 07 3d 97 b2 a4
> OOB: a8 bb 19 b3 07 e9 f6 25 52 d7 1a 23 e2 7e 0a e4
> OOB: 52 8a 09 d2 1a 86 3d cf b4 99 43 13 d3 90 33 0b
> instead of:
> OOB: ff ff ff ff ff ff ff ff ea 19 00 3a 83 db aa 8d
> OOB: 99 09 c8 9a 90 36 35 7d aa 15 13 07 3d 97 b2 a4
> OOB: a8 bb 19 b3 07 e9 f6 25 52 d7 1a 23 e2 7e 0a e4
> OOB: 52 8a 09 d2 1a 86 3d cf b4 99 43 13 d3 90 33 0b
> OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> OOB: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> (example with BCH16, user data [8,0], no scrambling)
>=20
> *cur_off (offset from the beginning of the page) was compared to offset
> (offset from the beginning of the OOB), and then, the
> nand_change_read_column_op() sets the current position to the beginning
> of the OOB instead of OOB+offset
>=20
> Fixes: 15d6f118285f ("mtd: rawnand: sunxi: Stop supporting ECC_HW_SYNDROM=
E mode")
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


