Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501361;
	b=caOkxXoeAK0vpfNcIbK1F+K8r0GTsciTqLW3IbpDN7g2ELBqufDlBmkDKcXEcsOw1ntU
	 so+ptA5rbcerH53VpmoMge2RiePfqPbHmIaN25Yse5TPGUqmCeHiNyOLyrJ6dtmr5zwQC
	 w2x603dr3dGafcl9AZH7Ouk+Xzx6iqKjBb/iTxJBf4+wJjzHYp09khVqBiALi0MQESEhh
	 jEb1I3ocyi+Z5/44ooX87VMbTsAEIIEDyCCwyUhZGpRbr61VD0DV6YwMivJ+w81YRTDpG
	 sS41r2i5L+nTyuMCiLDRDyszNG8ozINcVPhwKOEC5IeEIQMn/xWvd7hZlvILBPZL9XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501361;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=kFKk2wmFTktiWBkinQbeyQy7KU5vi6AbZejOP6Evh0o=;
	b=TEU4fBiglefqr4IyrAV55yFlg6LoxdMWXNmnIbmIzIWjhWqqK3E3e/3J+yPslIq8iNEC
	 CQi0SBa/dZ1/2jItEaDhnCL1KOvVrgIV9YQ0khAFW4jKcm9CGPc5B4MvyEztezHwnH3W2
	 LuWuKllnvYFMcqG8vV7B5ozO6SbjaOd65enjsASXnKDlrLgISVt5npwbF/p56qFTkSxKO
	 MbUv8qGHTj9hRhR1ttPDF04Ep5xyl9vz+z7hFTo+GinrhZbxjGnhzyAjT0MUJvH8PCeeE
	 Wwpqy0kSm+EcrtJ5mvhftGAmCybGVhruihbs1028Q4YajWnuvFSvScBDlqjHKgeXiRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jgIo9k1+;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FA8606A335
	for <linux-sunxi@lists.linux.dev>; Tue, 20 Oct 2026 13:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65FA8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jgIo9k1+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792501360; x=1824037360;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=y+BdJqhiXYpXERe2+BDHITZmzoRJNkRdqVPVKiVu7ew=;
  b=jgIo9k1++vrku0PAd1jSvPfoNsmniSU3A1DHu28tJ/04A+T73BKt5OZZ
   6XFmIC8dM4xh7Kqr3owOHKDFG3f0d69tWJsnarAchXWIXBDaGxgB3Mrzw
   Wf48WJNyUGh+PVl/Irpt8rsGAWl9jzfOGC985kJ+pQOHE3P6fjDzzF2Kb
   CSXaPs3Ko2QAqT3L08offeoMX1nG/b5mFIbaCCgYWOd5WIwEjubU4rVC/
   YmA6poFBUQdXbkqEIAKTrE77uhLU4Vo5i77Xb+e8KkGc37FOSTk+F3Lz9
   3fgfKbMyNe0Uy2/ofnu9C8r44/t9frIMlf6Rd7ajiq6mKRDaUcW4u5bcn
   w==;
X-CSE-ConnectionGUID: O/4EOWolTBeqby45dR9VLQ==
X-CSE-MsgGUID: SRbkCaV+SxGla8uZaLz2nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1236267"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1236267"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:02:40 -0700
X-CSE-ConnectionGUID: JDmXQi3xTMC/eYd7ejQnAw==
X-CSE-MsgGUID: dl3Rx7jyQoWW1J6Ss8j5pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3134984"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 06:02:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 16:02:29 +0300 (EEST)
To: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Jiri Slaby <jirislaby@kernel.org>, 
    linux-serial <linux-serial@vger.kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, robh@kernel.org, 
    krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-sunxi@lists.linux.dev, 
    andre.przywara@arm.com, wens@kernel.org, jernej.skrabec@gmail.com, 
    samuel@sholland.org, enzo.adriano.code@gmail.com
Subject: Re: [PATCH v2 2/4] serial: 8250_dw: Only accept a contiguous DLF
 readback
In-Reply-To: <20261020122746.41699-1-vinicius.eduardo.pedrosa@gmail.com>
Message-ID: <6c4a5613-7e10-64dc-a670-6407a4f1f6ed@linux.intel.com>
References: <cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <a79114e72d029732db6764935dde12aa5d497706.1792439398.git.vinicius.eduardo.pedrosa@gmail.com> <d992e18d-31ab-4937-8780-9c9dc423082a@kernel.org> <atcm2zqDs1P_EDr0@ashevche-desk.local>
 <09812a6a-dd0d-9c47-e1ad-5220f1954648@linux.intel.com> <20261020122746.41699-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1298893546-1792501349=:1177"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1298893546-1792501349=:1177
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 Oct 2026, Vinicius Pedrosa wrote:

> Hi Ilpo,
>=20
> On Tue, 20 Oct 2026, Ilpo J=C3=A4rvinen wrote:
>=20
> > For is_power_of_2(), 0 is not a power of two. And it also wouldn't make
> > sense to have zero bits in the bit field as it's same as no bit field s=
o
> > using just is_power_of_2() should be enough.
>=20
> I think the reg !=3D 0 check still needs to stay here, since the test is
> is_power_of_2(reg + 1), rather than is_power_of_2(reg).
>=20
> For reg =3D=3D 0, reg + 1 is 1, and is_power_of_2(1) is true. So without
> the explicit reg check, a zero readback, meaning no DLF, would be
> accepted as a valid DLF.
>=20
> I'll keep it as:
>=20
>     reg && is_power_of_2(reg + 1)
>=20
> in v3.

Ah, you're right.

--=20
 i.

--8323328-1298893546-1792501349=:1177--
