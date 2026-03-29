Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814692E5B1B
	for <linux-sunxi@lists.linux.dev>; Sun, 29 Mar 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776120; cv=none; b=D/QyRZgXBoYLA86895+rKqYIjOjrhxwkkBHMDOeOGsYmBVsV1CFf+7BYTSRF8zF/JOiCB4VGVgOMctB00AFRhDhhzUNRvk974gbvTBUGyNckGwfrrUCfFRshd/JSg4DPXMhNmPWKoOiTNAUbMJ9dMX/FRFKxtOkBucl7eFQ+rck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776120; c=relaxed/simple;
	bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqAJ3sC0Qg3PDzJLEV8JQCkQavVhRDZIdDKvZZHfZyHK1US2NseoMlnueP+ju8ouJhw6pEW3FgZlJfPKKdMYuV3x1UfRMD6QjRwJ6ZAwAoK5m494qIFhnRx39V5a3MtWWsBC9aasgx+XJlERC2YrLrBbLdCChaZ9jikC6e5Wck0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJp/nGxq; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJp/nGxq"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439b611274bso1861201f8f.3
        for <linux-sunxi@lists.linux.dev>; Sun, 29 Mar 2026 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774776116; x=1775380916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
        b=DJp/nGxqpRuGi7I5HBOalEGl1WrIuEriyt3AeqP9NBWSPtT6M8u8HCwzC730/YRX7L
         8TMd8KLIvIDgRNc7bBGwRh4PsHiJ/KnNKNab6+Op6HxP8ASw6o8Vl6BGuIf3iCgRUcLe
         lWcvYA7oKqtayR+tax2MMPw99AFYZjlOUgwvMMxDDUQ8HI+unPyqkH3z/x9br8EZ6AwQ
         jYW7uFpzMh4cQxcXkN7DaZ0PfghLht5GMC1Dgk6i0O0jg67+jyzAzv4LP/YKLqv1TcsS
         6CdJy49X4lltGfIlyp4196fTzamSpKje3pIob/oSn2NHZq1bcOJw40tIm8bqNFfxo6EU
         bzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774776116; x=1775380916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
        b=AB4VxGRPNhjVVil5isqZrBqs0WtQ+SParuYdDVbod1uTdJ9sW2Fz2wU5uhlDTzTmDq
         aycUPU/puFJhef3KRUUdDNyOPHgA8MSyyDmtgGLuPxHd4sOuHYiEQVp1i6B+I063B4N1
         QPs2LtPpqOq+++uRzI28XNc0gknilhSDpxNLRcltr+7HDGG00NBLsICzMf/PKsjvMFLz
         4SFrpAgzyD79kQ7HeqCGLjikbaLGh1XZVfVvF4Wtrp71rFFtCrp5xK5sXzrVZqQu4Ama
         6sFDzbmjx+nGRNuQVnTP37MgPsEGtweHpFuS6por+TKJUj+xek3gJhB43gM7oO2Z/3cp
         lQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZ+EYa+cXKiOppaYW4Gnhew2cFdpIoMRqyhzhejXzabbPndDw6DNXKEQHNo+YXiNqP4vbBgMbwz4rJ8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwK+1yZ3zP19xZwuRiPtRzqMM3n0xhlUc4a6hCB5hARLG3p4IiA
	ftl8W3FSjCeq8TGQVWL0qUIHibjWtaMFRpty64E2VG0vvDzsx2G6mnYK
X-Gm-Gg: ATEYQzwEpVxGrcIVDxHM5vAubVDI2exPl65lDRUt50Wqede1jy8biyv9iXMU7xgOnAT
	KZpkTU8Aw+b4exGu74yujMHy7oB/QCpmYZK8fahQQkQQ+7mTPI+qvsgBFQgMbcRAybwibYBgyhZ
	JjAzAux0d6QJGm57LyS6Glk40ueCOAS8zKIEa8V9sHlT5qaDkH8GOQAyHFkaYlhdK0WhMvpOgxD
	mJJRS/9rMo04JWhplnYDe7T7kXBI1OJ2ryxPt/jVkL6f/Z2t6PNlOh/9/sPokHmaNCSlKhNg8DQ
	sMGpejWOy+1EmD+v4+8JDBw4PeR6yU4iS04ApVc7yerEXl2EqJHAuyZiLuc2kb8vL2EsGtyVTpO
	8zTvDn616nrVsioCoLZmVzS+1w7na+Pb5msYQ70Ot8qvSqIGsfe/KQHvoLIOi8gStNxLhbo3poi
	fS5jPVC9U57aHqyGyU/q7eUBorx/iyXsTU6Qusm73n57aPVCzfSg0rJhA6NKAVKg3KfJ1MxY2Ip
	JNvxW1DhBqx0iHItw==
X-Received: by 2002:a05:6000:24ca:b0:43b:60f7:2282 with SMTP id ffacd0b85a97d-43b9ea4ae28mr14838629f8f.28.1774776115668;
        Sun, 29 Mar 2026 02:21:55 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm9945848f8f.9.2026.03.29.02.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:21:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, nicolas.dufresne@collabora.com,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Date: Sun, 29 Mar 2026 11:21:53 +0200
Message-ID: <2823210.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Das je P=
engpeng Hou napisal(a):
> Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> stateless slice control and later uses their indices to look up
> decode->dpb[] in _cedrus_write_ref_list().
>=20
> Rejecting such controls in cedrus_try_ctrl() would break existing
> userspace, since stateless H.264 reference lists may legitimately carry
> out-of-range indices for missing references. Instead, guard the actual
> DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
> V4L2_H264_NUM_DPB_ENTRIES array.
>=20
> This keeps the fix local to the driver use site and avoids out-of-bounds
> reads from malformed or unsupported reference list entries.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


