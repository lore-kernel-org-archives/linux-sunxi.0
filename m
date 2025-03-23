Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A29E15539A
	for <linux-sunxi@lists.linux.dev>; Sun, 23 Mar 2025 23:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742773982; cv=none; b=ZJVajEhR6yaVlXiL3/AohdlwsEkVJ4LHpQXWuoS0vFITz2ysOFFSR1SBcU4cJBr8OXU3YYJuWiM5Y/cpqm1pUCr8VzN/+OF9uxJHyteaNnpiRGrLB8I364Fg162FkoLyryQ1COAjzySefxlcZLURU15a92QjhBgUTve6U7g4hU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742773982; c=relaxed/simple;
	bh=ePhcB2wsmlAJB4Z2IKK9uDAgygX50j8F0TOygApO91U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PO4c4KEsTGaQGAdeNBtyGa3djqybw5osdijVssVp1dBSZu6L+dP3v0bWNYeus2LcOSgQFgFU3FhQsaVOQI500C2JmROnFOW+tO4mU5T53C0lH6q88MjCGPWVVrCUg/13x/FdwDYO0XFT26WQVKUAQ96k4tLsV6ME0y++6pgJgQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02399106F;
	Sun, 23 Mar 2025 16:53:06 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E0AC3F58B;
	Sun, 23 Mar 2025 16:52:58 -0700 (PDT)
Date: Sun, 23 Mar 2025 23:52:35 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>, Mikhail
 Kalashnikov <iuncuim@gmail.com>, u-boot@lists.denx.de,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 28/34] sunxi: armv8: FEL: save and restore SP_IRQ
Message-ID: <20250323235235.62fde853@minigeek.lan>
In-Reply-To: <8544399.NyiUUSuA9g@jernej-laptop>
References: <20250323113544.7933-1-andre.przywara@arm.com>
	<20250323113544.7933-29-andre.przywara@arm.com>
	<8544399.NyiUUSuA9g@jernej-laptop>
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

On Sun, 23 Mar 2025 13:26:34 +0100
Jernej =C5=A0krabec <jernej.skrabec@gmail.com> wrote:

> Dne nedelja, 23. marec 2025 ob 12:35:38 Srednjeevropski standardni =C4=8D=
as je Andre Przywara napisal(a):
> > Thanks for Jernej's JTAG debugging effort, it turns out that the BROM
> > expects SP_IRQ to be saved and restored, when we want to enter back into
> > FEL after the SPL's AArch64 stint.
> > Save and restore SP_IRQ as part of the FEL state handling. The banked
> > MRS/MSR access to SP_IRQ, without actually being in IRQ mode, was
> > introduced with the ARMv7 virtualisation extensions. The Arm Cortex-A8
> > cores used in the A10/A13s or older F1C100s SoCs would not support that,
> > but this code here is purely in the ARMv8/AArch64 code path, so it's
> > safe to use unconditionally.
> >=20
> > Reported-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com> =20
>=20
> I have sneaky suspicion that this is already the issue on H616, but I
> haven't yet confirmed.

That's actually a very good point: if we reset the core, SP_IRQ should
be reset as well - on all 64-bit SoCs, so also A64, H5, H6 and H616. We
are surely not in an IRQ handler when entering the SPL, so the stack
*content* is not relevant, but it should still point to some writable
memory. So I keep scratching my head how this worked so far. If I find
some time, I will try to dump the SP_IRQ content after reset, on those
SoCs.

> FWIW:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Thanks for that!

Cheers,
Andre

>=20
> Best regards,
> Jernej
>=20
>=20
>=20

