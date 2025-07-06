Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D9214A60D
	for <linux-sunxi@lists.linux.dev>; Sun,  6 Jul 2025 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.249.15.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751823161; cv=none; b=OnVS/UmpFp5zs/Hlifo9KSUVO7qF8BDvvHZtFsNLkzN9a9fU+m8WYxTdPIoayy4LW/1+xBMgd72FoSZGjvAKPavXKMWhfNlMtk7g9QvQC8pZp1j0U+PIzYb1wGyz9zyhdjPPnrHKHFa2W1NY+ltJYeA5vIjCxfC9D+HtmV4Gcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751823161; c=relaxed/simple;
	bh=n3IsK8ODlz1JKfSsL0mSiF4ZyAuv+Tgnm7BVnlfjl/Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ex4Rfvk4JBBSWJebKpeZnTH5OuItekBvilseCEH06seSuFszQkcHJYUWOnH+jCTMa4DN/UIWbPHsmR6zJHhmrkGvgQCs1NawgtxEehoLdd+lXCCmb2YGLFMC/ojHG0yzgvU32ww4YpSYP/LXhnNJLOoFvsdVB/Sq/+rd4UKO2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li; spf=pass smtp.mailfrom=netcube.li; dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b=nouCC7mK; arc=none smtp.client-ip=173.249.15.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=netcube.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netcube.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=netcube.li header.i=@netcube.li header.b="nouCC7mK"
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:MIME-Version:Content-Type;
	bh=JOvAlhhL4DkQigWqZpbWJ2xKl0SuEzl+W3GKAfQHn90=;
	b=nouCC7mK1H9um0bfh+0LEw0uYmycv0R5RrBWOxJWacoO7VXxcIsDma6ENjrx9Hr/1tSkWV3tW5zbXPIIVa4RcaAoEK8LLUoIl8tTMr3mXkVDPBsyaSh5fS20xlxUK4mNOS1Rgi2wKRUg9KFwBd5w0jFmaeYvfyMPnKPT36Xs7wY=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Sun, 6 Jul 2025 19:32:36 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: linux-sunxi@lists.linux.dev
Subject:
 T113-S3: reboot fails unless "wdt" node is enabled =?UTF-8?B?4oCU?= safe to
 set status = "okay"?
Date: Sun, 06 Jul 2025 19:32:35 +0200
Message-ID: <9473157.CDJkKcVGEf@lukas-hpz440workstation>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3290565.5fSG56mABF";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3290565.5fSG56mABF
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: linux-sunxi@lists.linux.dev
Date: Sun, 06 Jul 2025 19:32:35 +0200
Message-ID: <9473157.CDJkKcVGEf@lukas-hpz440workstation>
MIME-Version: 1.0

Hi all,

I'm working with a board based on the Allwinner T113-S3 and running a recent 
mainline Linux kernel. I noticed that calling `reboot` from Linux results in:

    Reboot failed -- System halted

After some investigation, I found that the watchdog (`wdt: watchdog@20500a0`) 
is marked as `status = "reserved"` in the mainline device tree.

If I override that node to `status = "okay"` in my board's .dts file, reboot 
starts working as expected.

Is there a specific reason why the `wdt` node is marked `"reserved"` by default 
in mainline?

Best regards,  
Lukas Schmid

--nextPart3290565.5fSG56mABF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhqszMACgkQJnN+drMV
Rtj+Vgf+PqRtyyZbsenPaibuZBJU0PPJduo+PI9OB9qD/HckALrOSjptXCUDX3vq
HadOr0Wr62Vp4hyefiBzAU28RDF/qa/XTc2e4JiBMT4X/hzUFZmROyzBFQD25mZ7
97HdHXw++iIm7bVYaDunzol07xH3c5dnC/Pc5TIqXuwuUZRZZRJ/AArE3NJrQ3vi
9KP/OWGqxbPrOyuRlKwsNV4l+WsANleTvrMZgzWPGSn+Ljgqw7Xr42VvUk0vfu8t
1cWsV5DTWrLw4l3ekdWbgCS7SJhip43+2/mcMxQQLCT6MMc2hp5Fgo8pZKcjkzUP
RVy0ZSmk3LeC/EmT4rx8B+yrvqkrbQ==
=M8YP
-----END PGP SIGNATURE-----

--nextPart3290565.5fSG56mABF--




