Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F682D6E6C
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 18:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588717; cv=none; b=BmDwvLavlX8BDsxH6NFjN9h7ocWO+hoa6JRIoYtRwRv6UHJpEmEQseMOpLurQqGXyiMrE6pme+eJ8jSGdEH6Dx0+G9x0KBf3/aourXioV4rRZA+FlS2sxT9vQ90fgrsacJiQK+N0pOcAzKFAe0IJnPsAtGPk0D5H2LN4XYm0Ays=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588717; c=relaxed/simple;
	bh=0K4nXT5/Js7e6nb85QjbFOWa38zA+AS+tQP3Aiw5h+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AlqD0DMYSsyqh8nH3OnlJxK/Z/e0zWnVdnP8QOo08XvbNgTPj5XiPiv7szpxN3GyWLbCUOgHJgSCmgkLoZclr28dTYZS0a1sgs6stYZKwqmO29TL2iGA0KZnNMVVf+y44scv3XTaahzxkENDxnnWEJceTOp+EozgrpXuvQ5dp30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMFkMJoP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMFkMJoP"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471b80b994bso70092825e9.3
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 11:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761588714; x=1762193514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/tr4wNuP/viUV2bLwDGJ/MFnyH+q9BQY2mO1mUn+Lc=;
        b=bMFkMJoPOhkuT6WfMv6gEgWBN7puYsVGOVNRyiT/qSDXWHsP1PX9BKKm1XvkJuWi2c
         0tjR7y9ru4qYpztjIvykK+Kup8pTAShoNyGhS448ka4zNU3Vv5gI9OYyAXVtPfuafUKt
         lPggJfJKuZtWkcK2nAxlnaXyy/WckIPdSbzCyyu+YisjETIiyxHY3g73z3NUfosSyG+r
         UKQ21jN92TNAmuIiyOuH5xCIRPaXRqlPtPTOaPsvgwuyHqtsF1D754Zu+N82AfpFw4RK
         rcKLVGkqdOopUhGQVsK/k6a7nQnjiNCulU+bhl1w1kE9apBDhgLhy2PshgMIKbIFSFUu
         IcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588714; x=1762193514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/tr4wNuP/viUV2bLwDGJ/MFnyH+q9BQY2mO1mUn+Lc=;
        b=ELffJfUvbVkC6SNVBJZSYIsTalagFD1H7dduXcoNMN0xp8qCLHMQIMIIt73lYDO919
         lD18lJw7oacNMb3XLKXTUvHiJW3rQivcQjRydTcgzuS/VcwxF/Yuu0Hw7cHqvqihzPef
         QDfurCp46viTDSwBjYRKX3O196zwsFX2R6Fz26kZVzb8NjffNbGTeFuCZtdmFX6kj/Vh
         yRh1TGU8gWjt41nmfH6Bi/wAipY7JUhl5WumGVWXFwpoFCJE6jZPrjHKIR+28wfV92na
         vy4GQfh5+n9w2y67kBfFwE6HvbhJMx1r/hNBfInhEg8+85zxKA1xIvTUkKmYRuKOSYye
         BTYg==
X-Forwarded-Encrypted: i=1; AJvYcCWJvW4I4sYo7WOklSgvbN7lTuCryl3YWUormvvXPtl0GeKUV9bEEP0dzDYy26M37Bx5xLWnnYSVAZcrWw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUdSspBOngKAJ05//OMfTgII6JtNVdZwmgcYS7kkh6JU+Fvl63
	l9woeKKR7gdTK7SiqRrGJmDbmxBM6GQc/k/gNqJi+JX9/r93JZrFnm85
X-Gm-Gg: ASbGncsooCJb0aXzK3YvQVkK55Qb6TeD38vL5bj56lN8zPCGnDFa95Os5wTXEDsj6Bp
	Wx7nFVdtRod3MNKEOnFXQx7Tyl+6eTPems2vblt89BkGdYU7PDnF4frH/gM7A8/0xktVuSWZ8ax
	iyWlUJy5ib8dMrQSiDvtB2iBEeBxXHOBla4uxLhfpZ6ucu+q2AIcAbptq5J4EQVNfWaxADPo9qH
	r497ObEmlRY3S5yV3F34cCeZJEiclZeqoEuyutXfsTF8aynT1J2zJg78vebfgfPgHG4CZuz2/YS
	W5YGYEJHIBNe/OMQngQzb8mBd3bRJFwIiwA+0SjNb7HlSxaQylbe2fRR/H+yPuKr5xsGT04KLK1
	Mxj5NaJLHYUSKz2/dV/Q5EY76WwdDPMeUftwMTV9n+q4aC56oMtrR+Wg1Rx3k85KCSgONh+VkSz
	K5oTq2zRtRq2VK+cCvZZQEpHBHsLNRpR8X3r/ft1d7EFAWmWyoTx5GsKJsp3fvR4L+5+aF
X-Google-Smtp-Source: AGHT+IGXaCcfOwLIrQj9yH9WMbrO4UAf1AZg1ch/afDpC4pXgTmkjf1NdqvThLXtmMqqXSWGbWSmXg==
X-Received: by 2002:a05:600c:4446:b0:46e:4a30:2b0f with SMTP id 5b1f17b1804b1-47717e6ab4bmr5964995e9.29.1761588713974;
        Mon, 27 Oct 2025 11:11:53 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da645sm14913054f8f.30.2025.10.27.11.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:11:53 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/30] drm/sun4i: Move blender config from layers to mixer
Date: Mon, 27 Oct 2025 19:11:52 +0100
Message-ID: <3382705.44csPzL39Z@jernej-laptop>
In-Reply-To:
 <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
References:
 <20251012192330.6903-1-jernej.skrabec@gmail.com>
 <20251012192330.6903-8-jernej.skrabec@gmail.com>
 <CAGb2v65KEKPtg=WZw9su_DBc5JKsjjYV3DmpUD+LXGhX96sEfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 27. oktober 2025 ob 17:00:05 Srednjeevropski standardni =C4=
=8Das je Chen-Yu Tsai napisal(a):
> On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gm=
ail.com> wrote:
> >
> > With upcoming DE33 support, layer management must be decoupled from
> > other operations like blender configuration. There are two reasons:
> > - DE33 will have separate driver for planes and thus it will be harder
> >   to manage different register spaces
>=20
> So if I understand correctly:
>=20
> - the "layer" is from DMA up to CSC, which is the last stage before routi=
ng
> - in DE30 and before, routing was limited to within one mixer
> - in DE33 and onward, routing is global

If you mean routing layers, then yes.

=46or example, you have pool of 4 UI planes and 3 VI planes. You can assign=
 them
in any combination to both mixers. Later you have additional Z-pos routing =
too
within mixer.

>=20
> > - Architecturaly it's better to split access by modules. Blender is now
> >   exclusively managed by mixer.
> >
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>=20

Thanks.

Best regards,
Jernej


