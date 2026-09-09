Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E80D49CF4E;
	Wed,  9 Sep 2026 08:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944076; cv=none; b=YPoUI+NsGWY6tUiZ3oXDon8Z2Wel1t82dbE0z0JQjWWKH87a6xt+M+Ee/ivR+kyJ3qAkw5VXW4lfhLnGIMIOOfXZVGyT2b3jqTGF45LwaSRwsjYY7HZ5Z8K6Uw3wBu2gag67/92ObAeHg5Hc8At3pk/p3ZDrJAo5eLWYskaVses=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944076; c=relaxed/simple;
	bh=Ko0zcdgUFpC5pIulydlXlLtpVPN+fSsWiRn8v70c6Gc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jeN8RwmyaUX9zt7kjaHgo+DaT/QwOTo+QmPtrpCb8CVgt4Sst9/RHADgZRipKHOjeRDV9//9OJiH/evnGJkw2s8mQWR1Slxgj55b6DSnOw137P5F/1we5KXO5Rc1CrI1bK2nkETkhnU8mdeSSZzqBaja+sx+rmRIZnN+ubYBTg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4go12tr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4go12tr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F201F00A3A;
	Wed,  9 Sep 2026 08:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788944075;
	bh=chzpMzHi16ugExNoA64yQPdrJ+/2HR/Mf/l1JEZLvrI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V4go12tr4wkjQoEIGwpx8Pv7UJdX3bxYXiu+geupcFeabXomXlLkaxR0G3XaEQpko
	 iBJ/AFFdJQaGFcPInnOkXgwYIKi0EjoPfSRo6QGwbLTUdp/O4DvzWZcSYb0nljwwIt
	 ZBpjAzgYqAwL8xxV7WXo1q4NF7WfS9VeEstYA3NJuF9HhAPFEzjZDRY9IXz7dJLWF+
	 V+XytQyV768gwYmhH/PMkJKAaEVNypBXuqbDXeDVeLn81cmi4o7Ef8IbQfYcsLEWlZ
	 tBYQ8V5SJxLLDD9tPGCp0P8EQ17W1wnpWTh8iGd9/7TM7OmEiZa+9cLwlYqUSJ9Vyf
	 sCqlP/oX1EHbA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/15] mtd: rawnand: sunxi: avoid duplicate chip
 setup before page commands
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-13-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
 <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-13-838cb0ba1547@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 08:54:34 +0000
Message-Id: <20260909085434.C8F201F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Wait queue spinlock corruption and false completion due to concurr=
ent complete() and init_completion() after a timeout.
--

commit c6cd2e78faa74b2944e87ef8eeedc8e3e99b27b5
Author: James Hilliard <james.hilliard1@gmail.com>

mtd: rawnand: sunxi: avoid duplicate chip setup before page commands

The page helpers invoke exec_op(), which selects the chip and programs
its timing and spare-area registers. Remove the identical setup directly
before those helpers in the read callbacks and PIO write callbacks.

> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index dc5b3814657e7..0d829103b144b 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1743,8 +1743,6 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_c=
hip *nand, uint8_t *buf,
>  	int ret, i, cur_off =3D 0;
>  	bool erased_chunk_found =3D false;
> =20
> -	sunxi_nfc_select_chip(nand, nand->cur_cs);
> -
>  	ret =3D nand_read_page_op(nand, page, 0, NULL, 0);
>  	if (ret)
>  		return ret;

[ ... ]

While reviewing this code, I noticed a separate issue in sunxi_nfc_wait_eve=
nts():

drivers/mtd/nand/raw/sunxi_nand.c:sunxi_nfc_wait_events() {
    ...
	if (!use_polling) {
		init_completion(&nfc->complete);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but is a pre-existing issue. Can
this lead to wait queue spinlock corruption and false completions?

If a NAND operation times out in sunxi_nfc_wait_events(), CPU A clears the
interrupt enable register and returns -ETIMEDOUT.

Concurrently, if the IRQ handler is delayed, CPU B executing
sunxi_nfc_interrupt() may read the active status before CPU A clears it, but
get preempted before calling complete().

CPU A then starts a new NAND operation and re-enters sunxi_nfc_wait_events(=
):

drivers/mtd/nand/raw/sunxi_nand.c:sunxi_nfc_wait_events() {
    ...
	if (!use_polling) {
		init_completion(&nfc->complete);
    ...
}

When CPU B resumes and calls complete(), wouldn't it access and modify the
lock concurrently, causing lock corruption?

Furthermore, wouldn't it set the completion flag for the new command, causi=
ng
it to return prematurely and process garbage data?

Since there is no structural prevention like synchronize_irq() or
disable_irq() on the timeout path, does this need to be addressed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-submit-sun=
xi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com?part=3D13
