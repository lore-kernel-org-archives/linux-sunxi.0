Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D9B224FA
	for <linux-sunxi@lists.linux.dev>; Fri,  2 Jan 2026 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767314458; cv=none; b=tSRsVdM2UErCxR7QqiSQh7zZ/sBqVjETzFPhFasKME6nKfSaGaNsAmFIhXMyXogDQv5zhSy9vXK8V3b44uJoQkgWPdE0f19OPUDfPB0WrfyGT+68Vijjkji1vK/Pf0FpHcAIe3b9GBSoKtymLfVAt5L5xywVO50t8eVpr29muwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767314458; c=relaxed/simple;
	bh=2GH4EbdRAnl8aNLzPHd0upgVS362xQwEORi+r+/UGH8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dZfuXEBL3yC34TNw9uEXvllwOAkfNsioAqyubOFdY6nzAPDw7MI4As08UIR8oqb2biM7GQC0c2YtCn8I7sQwo6iXQiS6Vbnn9eQ7K1YRqcFXDiySJKABaFZW9N/6s6YUGplZ6iOKA2FnjBj9+3lQs2L6+w7N9o2aCUbJQfaF0kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AD91497;
	Thu,  1 Jan 2026 16:40:47 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DBA33F694;
	Thu,  1 Jan 2026 16:40:52 -0800 (PST)
Date: Fri, 2 Jan 2026 01:39:34 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Yixun Lan <dlan@gentoo.org>
Cc: Fabio Estevam <festevam@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev, Jagan Teki <jagan@amarulasolutions.com>, Tom
 Rini <trini@konsulko.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Paul
 Kocialkowski <contact@paulk.fr>, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v2 06/10] gpio: a733: add initial support
Message-ID: <20260102013934.240a8ad4@minigeek.lan>
In-Reply-To: <20251130222004-GYA1814866@gentoo.org>
References: <20251130-01-a733-soc-support-v2-0-18bdd4376fad@gentoo.org>
	<20251130-01-a733-soc-support-v2-6-18bdd4376fad@gentoo.org>
	<CAOMZO5BG63ndAg7yTdMtBi7nHQjCGcrS9Sr0M5XfAiBkrC-oAA@mail.gmail.com>
	<20251130222004-GYA1814866@gentoo.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Dec 2025 06:20:04 +0800
Yixun Lan <dlan@gentoo.org> wrote:

Hi,

> Hi Fabio,
>=20
> On 19:09 Sun 30 Nov     , Fabio Estevam wrote:
> > On Sun, Nov 30, 2025 at 6:47=E2=80=AFPM Yixun Lan <dlan@gentoo.org> wro=
te:
> >  =20
> > > +config SUNXI_NEW2_PINCTRL =20
> >=20
> > This name is not very descriptive.
> >=20
> > What about SUNXI_A733_PINCTRL? =20
>=20
> I'm open to this, but want to know Andre's suggestion about this,
>=20
> The idea here I've chose a common one which follow old convention
> and hope to re-use in future generation SoC..

Yeah, NEW2 was more a working title than a proper name, but predicting a
better one is tricky. And also the new layout is only valid for the
first pin controller in this SoC, something we don't know of if it will
stay this way for future generations.

So I say we go with SUNXI_A733_PINCTRL, and use the
CONFIG_MACH_SUN60I_A733 symbol to denote the special arrangement for
the secondary controller.

Cheers,
Andre

