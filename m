Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047AD353A65
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Oct 2026 20:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791750479; cv=none; b=lDJiP2Z+i5wQInrcndbUPJTcxLOmDcieSAzo2XEWhP2+ekidVMgK/sLVLcKrMnqS0Ff64B13YVzJEvNfIMhM0W1sPCsfuWqxan9KrO8nZXAoOhZ98eeJQHwLB69YZJYR/nvEXhneRNQbFflnj5MjwJhLBPFbLfJXg2TPaER86p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791750479; c=relaxed/simple;
	bh=C4mwaLGCa57klLjJDqHf8uXMvhxCEah6UJYl7mGVUNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBR2Uboc1uMvuaISd71MDG8ySWXrWHo859A4eDdxSGsDc8gmiuQSfTvwma/KlAmTtr3iGrmNt03SpmpomG+OWXm3HJAg8vDicMoluiUy8sqf4Qt1+e9hJRM8DfFghGjV5IstWS9KmQete0MKayC5X8UjOJfBh4uMA5qZS8tdCKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fMAyCurt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fMAyCurt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84EA1F0089C
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Oct 2026 20:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791750478;
	bh=C4mwaLGCa57klLjJDqHf8uXMvhxCEah6UJYl7mGVUNc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fMAyCurttbzhgWTUnrXWc3iEZ9/89VpnCcCUd6twqlry2XlRD4jZPKzXoIjJtxUvK
	 YntVcAybqLQJ+iyRPHOTj4SShhC4NHGwE4+w/ruEqMDXkk7XIHPha8RRbxGDG4/YCO
	 +QIoIhs/NsRZfuqhbct5dHDVrY+1fkM7u+BrbQhEfD0PC5zbr9u39ZA3sFfgzcrJ4F
	 dvZ2MticRw8bx5UfbzlDmH3ZHUzu4ssI0GaD4iZIAWhYyzC6tygdpA27yEOmpn+8ey
	 xjBKiglMiQEbm1OfGbCDb7myeX7IVJE9xXGeUS71ckcNOMxLP4456QNkuoqJWb0ugg
	 Xa6CkVYXbSxJA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a87e23860cso15500261fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Oct 2026 13:27:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzprofTDDh5mUBOWwuxvIItbg1XRUfXKX39GLzvmzAh/z7t2Cd+SDpItDhKzaPWhyEFD1CMgeB4k4isTQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIgNT3CETt0VEnbfk/RNGXgZXnex9N8hfYQJB/+ehBizfR9vJm6
	l8oMjYSxXRXE15CsvJuP/DbE0kAGHBRyr2rflXr5FY0Zofm2SxUMoKIot9yev0spCoGVvmuRqIG
	thmtRlYlDtTNRsfd/fw+7Ax19+FuFehA=
X-Received: by 2002:a05:651c:2121:b0:3a9:dd56:bc59 with SMTP id
 38308e7fff4ca-3a9dd56c399mr6626541fa.13.1791750477604; Sun, 11 Oct 2026
 13:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910133519.459011-1-andre.przywara@arm.com> <20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com>
In-Reply-To: <20261008194719.328146-1-vinicius.eduardo.pedrosa@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 11 Oct 2026 22:27:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLnOmttzkrT7pa=o5pRq_o90p3a2_ssHX_odQ6dFS3_x_w@mail.gmail.com>
X-Gm-Features: AclHuK-jhop6QweQuut3yS6CaY8pcraf3pdrsXYPB174sqV2QY9XVovESPN3qi0
Message-ID: <CAD++jLnOmttzkrT7pa=o5pRq_o90p3a2_ssHX_odQ6dFS3_x_w@mail.gmail.com>
Subject: Re: [PATCH 0/7] pinctrl: sunxi: Add Allwinner A733 support
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yixun Lan <dlan@gentoo.org>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 9:47=E2=80=AFPM Vinicius Pedrosa
<vinicius.eduardo.pedrosa@gmail.com> wrote:

> Would you be OK with disabling the io-bias programming for A733/A733-R
> as a fix for now, and doing proper voltage mode support later? If so
> I'll send the two patches, with Fixes: tags for 0535bfbfa97b and
> 31d68e10381c.

Just send the patches so we can review and discuss, no need to
ask permission, if it's not OK we simply don't apply them. :D

Yours.
Linus Walleij
