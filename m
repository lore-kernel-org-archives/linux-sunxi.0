Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CEE1BD9C9
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790172546; cv=pass; b=nggb6UiBTTAm4lLtkli6eHnrXDNOh/OwYoo3jad+td+P27pvGX2iuxItvxigrh9W8zENiLyA1I5fO+NsZMU8AVmfBjBF4VmmtFDwPwxKwqm0LampCdrVcDAsaExM4gus4IIi/S5/Eef9jdfo83d4gFhZ3/DYkBd8g8JscNSZ3LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790172546; c=relaxed/simple;
	bh=zh77WLj57tnzDN5u/ThmFJq/ky5id0Ya3MXNME0C5I8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bqm59+liiXMIZD2vpqHt150gWXn21Vn3vxHzbSYgHeUT5qJz+cUFrxcIAnhG9EMqtvNzOwYWPEJ+9W9O/1i9lVNVnDBtL1N2eabLxAZYxEyPkzdxBh+ICo0IvyEzzB1mdPjVNEG63HY6qtOokx/ZfU5JfkFW6P7Zcv6Bkj5/B1w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=RK6rMu5i; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="RK6rMu5i"
ARC-Seal: i=1; a=rsa-sha256; t=1790172521; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F33g7b5uYY27Q/HKONhzqRoX1yUZngW8GLRy99QeATGs7iVLa6fXFXFp+bmphC2YZ65T2wOgeWVDVXReGszvhdESQBIL5SWn9E+vGgzhX2CosPnkLkv7VkczfP9OK/gmNuacDdKoXFF6KySJab3bDZH3rZotX5TdXPLalF6lCX4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790172521; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ctpe/eDRlFVbZnthdNX29MzI4lYShyW2hkRWR1MzG1k=; 
	b=HDaNTViRqXcfimQKW7Gkp/dOXuanyH9mP+muyqnjCYgnCZBesP4BiMPr2P2HTfhF7qrVlQig+rCWw7FBxG99AOtaHMD2WBq5duxApQHWIculYwFfaNw6RknZYMcfoKhuIjuhrjLMpPVqidyh1bCoQvsBVjzW5j9OBQaHii/LHAY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790172521;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=Ctpe/eDRlFVbZnthdNX29MzI4lYShyW2hkRWR1MzG1k=;
	b=RK6rMu5if1UbA5uX8z+2XGVInBdJp5M94kYTk6BurTgShWL3qbYSj2gIirk1b0ym
	X/12L8NCQvCdkpT2l2rmrnVAduQ69ZVSqtKoGEZG4du3SGql67Q6BS0oqWIs+YZKGqw
	BgPEUD5zcFVmDoOgqslEaUVdTenyC8WmmpPTD+yU=
Received: by smtp.zohomail.com with SMTPS id 1790172518026689.0899152113249;
	Wed, 23 Sep 2026 07:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Sep 2026 22:08:30 +0800
Message-Id: <DLMR6Y4BCAEJ.1QOAOOJRGJIN5@pigmoral.tech>
Cc: "Junhui Liu" <junhui.liu@pigmoral.tech>, "Brian Masney"
 <bmasney@redhat.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFT 0/2] clk: sunxi-ng: fix A523/T527 single-divider
 clocks
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>, <andre.przywara@arm.com>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Chen-Yu Tsai" <wens@kernel.org>
X-Mailer: aerc 0.22.0
References: <20260723004856.55158e84@ryzen.lan>
 <20260812201502.264919-1-enzo.adriano.code@gmail.com>
 <20260921200617.3180471-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260921200617.3180471-1-enzo.adriano.code@gmail.com>
X-ZohoMailClient: External

Hi Enzo,

On Tue Sep 22, 2026 at 4:06 AM CST, Enzo Adriano wrote:
> Hi all,
>
> This RFT series has been superseded by Junhui Liu's tested four-patch
> series:

I just realized that you had already posted an equivalent fix before I
sent mine. I have been quite busy recently and missed your series, so I
ended up posting a duplicate. I am sorry about that.

I will make sure to check the mailing list more carefully before posting
patches in the future.

>
>   https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pig=
moral.tech
>
> That series implements the M-only and P-only clock conversions, was teste=
d
> on the Radxa Cubie A5E, and has been applied to sunxi/clk-for-7.4. Please
> disregard this RFT series.
>
> Thanks to Junhui for completing and testing the fix.
>
> Assisted-by: Codex:gpt-5
> I reviewed this reply and take responsibility for its contents.
>
> Regards,
> Enzo

--=20
Best regards,
Junhui Liu
