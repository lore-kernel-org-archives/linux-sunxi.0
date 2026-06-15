Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734973AA4ED
	for <linux-sunxi@lists.linux.dev>; Mon, 15 Jun 2026 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538425; cv=none; b=t59b202fc8bsxkEeslLSxKPJX+44+yjyUrXhCCnAUyPdqB/Dx8vU1Vxc4E7OFHvRoqGHCS4zNPbq3bsAkm9+6DbzFSy26b/WkR9IGfRds8yc5wBbCLArUiOZv+KXJx6PZjXrcQJ8UPiSaTfhJhLl4uAApFiV78iHBrQcX4oboi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538425; c=relaxed/simple;
	bh=KjI9RSrMpeF9kl7KVlAoFqnYJfNf7P3l6mHXMFpoLdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hhq58+3VGxIVS/PK1dr7XQql8TuCZ9L68VeXrJgpIXf+W2wrOVoxeFjeXWDl3QxAtOJ/aAtGOYQUgjlmZ71alZBLjwPRU2VGY6caZanRKfrZpCK/b/ZnSFHtPoVzBOOtWgt1Vy2WDxVHKG/qr+2NAN7hSYWJZnIjfpXf5r9frIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6/8TuIn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6/8TuIn"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso2420982f8f.0
        for <linux-sunxi@lists.linux.dev>; Mon, 15 Jun 2026 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538423; x=1782143223; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjI9RSrMpeF9kl7KVlAoFqnYJfNf7P3l6mHXMFpoLdk=;
        b=B6/8TuInYs0n7mk3erylrBFSbecOmdPMRwwDQjcX6Vtx58VfNRIFfBiF7j0U1OFYX3
         ad7h+N2fd653jKmNk9+d8qETehfmxu9EoNOUJ9CQ1TOwuEa0Dq6UKKIDpPAU0G4PzJjT
         +iRtUEMn+r9LMkhEj4Fkum2WHZomBWY/PoIZF/wQKcfQy1SZ7xeTNb8Yxfttq/X1opUG
         X+eVUbDiN9p8we05uXXpzD7WIQli4n0d8TSEaXrNXQvm2b8JQKyzc4On3yBrmHN5fkW7
         zA3n3bkPZIe1sbkK1+/SxpBG5R/ex/hLBw+jUC76wYGsmwo4dMJ6YGAApmHWfrQxQSIG
         +oPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538423; x=1782143223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KjI9RSrMpeF9kl7KVlAoFqnYJfNf7P3l6mHXMFpoLdk=;
        b=Tz8LNESooAUioymDYsbGk38F8MFSCcaMsbuzt2Ngb06pivKm0ZKYlQNWPHut0nz0T/
         5cyVikDBYlzHTkRM9O6mh7xXvVlLbYxoMcGsUw8nD+/fyEOsujyg1vDP+X5asHEkprw5
         3H7aCtZKi5t0ZHiNeIzIPSblrVMowB9VUvD9+LEF5r0yE6WB/ZoqAPurrcj15kMwpyy1
         4aimfdYmE/SaRTkpsZDR5j47jzFnuhoNKTF03EGaj2ofXiMSc7ZsKoOixOx9hIHs8/54
         3tuskSM37szvOBvb0n9tqi0T5pqfSlLjqJZXv7XpFCeKEk95XD5LDqdNp+YLKAmp/qzh
         xOUA==
X-Forwarded-Encrypted: i=1; AFNElJ9de9dOu/FESMgwXI9ga/l8GkDCkL9ku2YfQ9waCPDn7cJCA/ebRSrbzPFgBbT3rKvQUcYPfUJwcjz/ng==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmLYcL59UD9X9yWRtZJtQGuX4ReO0YsV+CeCG/CdrzfCKdYQqk
	n0OLcYKmTk+PMono1aer0NEoV+ogVITpU6F95MbVS5FIVFo3LM8QBXJ5
X-Gm-Gg: Acq92OEGHB77q0VqbdptPQPLA1k1o237O7BkP7TfZy1+/wEsrRw0DadNZBgCQFLXX5f
	yX4+W1x//ACAMzh9Xesu8A/Hn4fFe+jXBdzg5NAwCA8JALTYGxbFJfv+ufKisNq8Np72dxMrR2Y
	nOgWtzzaT9ZfnRTh3gyQNwXm6wJ7JY6eqNPrHOJQhT0N33mJXZ/2oV8zxa738eRbH3bWpvmurvD
	nEs9rgMyTBQpn5YDwuCw5QHhvye8OMqYwgBwsRO9xBd9bIdV28V/+qpCkX2/WOmCPU56m9b+Pax
	p55eDHvhgBNMgl9Rzw3rK29q6ddbI8g5S1xx0fPtmeUNiN0IitKN7HD6iBSbNwNx0euWMprYfDZ
	qK2rv2o91VeNuzX9T6KmJ2Wb5mj+Hs326Sg+LlVSmOY9+bUpmwORYEPG+/rjGzGFykTm86l8oad
	6dsJnScV/wMFaFzZOfc/mtqZzBRLj+FnKh325VMvyihs1NP0SXYyrJQXGZ6xaM05ygvyZ+gTk87
	wYw/6CdGWSXAe6ZlQufRzp8hFn7Uo+v7V4qDw==
X-Received: by 2002:a05:6000:1acb:b0:460:1bf8:c981 with SMTP id ffacd0b85a97d-4606da57c41mr20753889f8f.5.1781538422504;
        Mon, 15 Jun 2026 08:47:02 -0700 (PDT)
Received: from jernej-laptop.localnet (92-53-159-70.dynamic.telemach.net. [92.53.159.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c4240sm32724851f8f.27.2026.06.15.08.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:47:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: samuel@sholland.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 7/8] dt-bindings: display: allwinner: Split H616 DE33 layer reg
 space
Date: Mon, 15 Jun 2026 17:47:00 +0200
Message-ID: <0r4us4OeRRWtJhxvps-bZw@gmail.com>
In-Reply-To: <86943057-f5b4-4fae-9172-45f13814494f@kernel.org>
References:
 <20260509190015.79086-1-jernej.skrabec@siol.net>
 <nIKN_benRn2Bk8SDZrkMCA@gmail.com>
 <86943057-f5b4-4fae-9172-45f13814494f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 15. junij 2026 ob 06:28:54 Srednjeevropski poletni =C4=8Das=
 je Krzysztof Kozlowski napisal(a):
> On 14/06/2026 16:08, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 25. maj 2026 ob 14:10:38 Srednjeevropski poletni =C4=8D=
as je Krzysztof Kozlowski napisal(a):
> >> On 24/05/2026 23:33, Chen-Yu Tsai wrote:
> >>> Hi,
> >>>
> >>> (resent from new email)
> >>>
> >>> On Thu, May 14, 2026 at 2:04=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> >>>>
> >>>> On Sat, May 09, 2026 at 09:00:14PM +0200, Jernej Skrabec wrote:
> >>>>> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >>>>>
> >>>>> As it turns out, current H616 DE33 binding was written based on
> >>>>> incomplete understanding of DE33 design. Namely, planes are shared
> >>>>> resource and not tied to specific mixer, which was the case for pre=
vious
> >>>>> generations of Display Engine (DE3 and earlier).
> >>>>>
> >>>>> This means that current DE33 binding doesn't properly reflect HW and
> >>>>> using it would mean that second mixer (used for second display outp=
ut)
> >>>>> can't be supported.
> >>>>>
> >>>>> Remove layer register space, which will be represented with additio=
nal
> >>>>> node, and replace it with phandle, which will point to that new, sh=
ared
> >>>>> node. That way, all mixers can share same layers.
> >>>>>
> >>>>> There is no user of this binding yet, so changes can be made safely,
> >>>>> without breaking any backward compatibility.
> >>>>
> >>>> There is user. git grep gives me:
> >>>> drivers/gpu/drm/sun4i/sun8i_mixer.c
> >>>>
> >>>> which means this is a released ABI. As I understood, the old code was
> >>>
> >>> We held off on merging the DT changes so that we could rework this.
> >>> I can't find the actual request though. It was probably over IRC.
> >>>
> >>>> working fine but just did not support all use cases. Why this cannot=
 be
> >>>> kept backwards compatible?
> >>>
> >>> AFAIK the "planes" block is shared between two display mixers. As the
> >>> commit message explains, this prevents using the second mixer, since
> >>> only one of them can claim and map the register space. And on the H700
> >>> (which is the same die as the H616 discussed here but with more expos=
ed
> >>> interfaces), there could actually be a use case for the second mixer.
> >>
> >> It explains why you want to make the changes but not why you cannot ke=
ep
> >> it backwards compatible.
> >=20
> > I guess it can be backward compatible, but I don't think it makes sense.
> > Yes, original driver implemented original DT bindings, but there is no =
node
> > which uses that binding. If there is no user of that, why would driver
>=20
> Did you check all out of tree users of the ABI? All vendor kernels,
> forks and all of them for which the ABI was made for?

Since when do we care about out of tree users? I understand that drivers
must support old device tree files. Once they work, compatibility must
be carried forward. But that's not the case here.

In any case, vendor kernels have completely different DT structure. This
was developed independently from them. Take a look at [1] how BSP DT looks
like, specifically Display Engine node.

Of course there are some distros which grab WIP patches from mailing lists
soon after they are available. For example, I know that Armbian carried old
WIP patches which used old ABI. However, such distros generally don't care
about exact solution and ditch patches as soon as proper solution is merged
upstream or even when better WIP patches come around. DT files in such
distros get updated alongside kernel, they are not hidden in firmware.=20

Best regards,
Jernej

[1] https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-4.9-s=
un50iw9/arch/arm64/boot/dts/sunxi/sun50iw9p1.dtsi#L1315-L1339

>=20
> If there is no single downstream/out of tree kernel using this ABI, then
> of course you do not need to consider it. I don't know how would you
> prove that but I am open for suggestions.
>=20
> > need to support it nevertheless? Supporting only actually used DT bindi=
ng
> > allows for better code architecture, as there is no need to support sec=
ond,
> > unused path. It also simplifies testing, since developer doesn't need to
> > test both paths if code is changed in that area.
> >=20
> Best regards,
> Krzysztof
>=20




