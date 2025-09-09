Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A019A2EDD52
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 16:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757433988; cv=none; b=KKF5fxhR00hbpbvsaHWLKMIBeY7lB9VxoK1CgK10qGiylu7E3ngz02I7gEfsVxryZU2AiFu1stKnUqCuwF75w4EHbeQWGVKaXLxbFqeR9r/eTuTpKYr6/Pu9UtXK1q7FnH9vpAfxn3/9jnQfV54dJeiRAePN6EuN6jZEsLl2iio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757433988; c=relaxed/simple;
	bh=mqM7enTl5JCEBh5L5tH8TyjNRitV3B594uobCX8eDCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bJ5Kyj37hJjwZfJj+e/UN7Xv7DNMzjh3NjK+zFieAKhGhtoKNjxP7ACHSpvWoxu/4YBoWgfwONJ+/XhVEaGoJIaLQeqvRdh0xCcMfY4/eLfiZBURDLfdaxRRCd8ruKMZ2JTR73IdxIHuHGEKlEiS5GsFZfRpPeyszmJ/HsjguQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-55f6ad5146eso5421678e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 09:06:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757433983; x=1758038783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mqM7enTl5JCEBh5L5tH8TyjNRitV3B594uobCX8eDCc=;
        b=Qtd/RN9BOd9E6Zy/kkuLaNDVlJAf1WsqTmWZDVPEny81aAFCwhTGuV66eKCqzkh8Ak
         5vehPOO9mAceTKxoyOEfQ1kmh724MOPxsP5DX4FnRQk1jUyHZfI2LZH98U6qCiN/ceur
         IYAtevHz7E5Wdr5ywWsF4kYkPGjJJbyfBomOFG83Gu9J/pXTRpXI1jfFOimk6Zr11H06
         wk1RA8mmnviOdeGmwMglMK/rS03MF/1TZ4PqwFK1xpUqJFgA6W3pbdnxB+E220uSl9sj
         M5c3Ur49lB2zhhdTheomsCK/u8/vJKS+yBV70cVIvvlmmiWTzTtC+LQ4L427tjo94zQb
         bKhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwOUxhl/uLcXPY+9bt6QkXbH62bz5VosS+sZCXDhDI1Tki7AQVBwrtYd2cSUQxujq0xim910ENDw27tQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWJEL1o84KCjoPT2TLehQJ4YXPDPmc57E8pILHNER5cQpsvNtB
	68sTPU7Qwd/9s8C1GkwUjHlbPZuL8Z/H5/roBFsirABXkO6ef/m/EmJ4YnQdSKwi
X-Gm-Gg: ASbGncs3unbTWpy/1WccQsyPpgq3dNXmOSL6wskICLRtnraloKuXNqTN14/jADhr4Nb
	NLJk+na6XnSguz6J0LivD2S97WJpgTrs4FgkfMiA2G3zdl2DlMo/gKROeolUvbIdtUNUmcaqvxE
	E97gs9CjT8Xq31ZJv30c89BjpowT9Fo2oLRkILNlIP+h6zynh74/rUfQ0StRfEP/LNco5ejcPbr
	yysiL0ObEclrUBAojt+qlaaKbfPByONLz+27Rzrg2byY5pHHuSc99GGiMpn2At+MN0tGObVXRu1
	BqpbHBN52z0J1zj/wEVSLXGTi9d89m8Yek3AqmXGJnihVJRErE/nDEGuMiGf9PNrAij4Q+jMDp8
	cU5LMbzXJbA5uqHs+tYO66fTdcna/mad1BY4hDZe3VqF58YWAh696AdmqTueXKddyFw==
X-Google-Smtp-Source: AGHT+IH9mm5rLSTqQYmm+LXy5EiPIJ1sVyU2xYJLSJO9TBWEVFC2ooSH8MORfoA2yC3VoBt2jNup5g==
X-Received: by 2002:a05:6512:a8e:b0:55f:4ede:6518 with SMTP id 2adb3069b0e04-5625f536248mr3849731e87.6.1757433982967;
        Tue, 09 Sep 2025 09:06:22 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5696c03bf3csm383341e87.69.2025.09.09.09.06.21
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 09:06:21 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336ce4a894cso44100371fa.1
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 09:06:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOhqnTy//OTvodzWLkHTStk5JwDucZkWzJluSaSOkyT2vTp344Jj8H+4edStM5EMrWB3qwAosCOmTtPQ==@lists.linux.dev
X-Received: by 2002:a05:651c:1118:10b0:336:de52:5c33 with SMTP id
 38308e7fff4ca-33b58cbe583mr29181991fa.16.1757433981198; Tue, 09 Sep 2025
 09:06:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-3-andre.przywara@arm.com>
 <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
In-Reply-To: <CAGb2v65rRqTWvn2NR-OSeP-zVJzheJ=L0YeG5DOrCTPJ8Haiyg@mail.gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 10 Sep 2025 00:06:07 +0800
X-Gmail-Original-Message-ID: <CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
X-Gm-Features: Ac12FXxEC7pM8O5XaLI0ogPtLktnWEqjnqEb6kXbRdWLZTDBJ17zyeRXdPd0u4w
Message-ID: <CAGb2v66DEh3ZGTsBkX6RELRs+0ZPbMq7bsNQhdUcpxHHMxDhhQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: sunxi-ng: generalise update bit
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 6, 2025 at 12:15=E2=80=AFPM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
> >
> > A few of the Allwinner A523 CCU clock registers introduced an "update" =
bit,
> > which must be set for changes to the other bits to take effect.
> > Of the three clocks where this was used, it was always bit 27, so we ju=
st
> > encoded this as a single bit feature flag.
> >
> > Now the CPU PLL also features the update bit, but puts it at bit 26, so
> > this flag trick won't work anymore.
> >
> > Add an "update_bit" field to the common sunxi clock struct, which takes=
 a
> > bitmask, so we can encode any bit to use, even potentially multiple of
> > them. As uninitialised fields are set to 0, we can use this as a defaul=
t
> > bitmask to set, so can OR this in unconditionally.
> >
> > Change the existing update bit users to use this new encoding, and add
> > support for the ccu_nm clock on the way, since we will need it there
> > shortly.
> >
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Hmm, actually, we also have the "key field" feature. Maybe we should
generalize that one and merge the two?

What do you think?


ChenYu
