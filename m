Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B8B34164B
	for <linux-sunxi@lists.linux.dev>; Tue, 13 Jan 2026 10:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768301098; cv=none; b=TSjm+667jDD/35Kc7gCbU1Dej4DDwBkM6jkhbdZyVzyx/5TQZVyI1bnkgvC2aP5BVCtqERO27GVrDKTtdFdnSyX92L5ZUEItcZQYbLp4lZEflocU7vzeml/XGNJz49lsglIzqdG/eZ2aV9mRCNV8PLfMgym1a4iKbLVf4232IHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768301098; c=relaxed/simple;
	bh=HbS0CedmhsBby5my0etEwrSLi/DDs8uKq43u6/Xgpd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMKgIqXCwBGlyLyFR9Jw7sTX1ezA6nbGcpWus+Q4sJmGxRK9VfIwMxhmim+dwbF7YY0XJX98+dr20pVGzJN+XuFafxNi7B0sn15qGdcH65AWAfYYwFs3448hLUuw/MVXqonmT5c5YJ0pORDojYf/N3ukFXe/8z5Im5F5WikXzfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bTwKlxI0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bTwKlxI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=m2C1
	Cq0R3bvdmMZOqB7Bn3CVMUrTKnWJxHrygGNnHrE=; b=bTwKlxI0nNgr2gHLIeSB
	hDI8XILoB+81bZJ+jIufbsZhBJUuEzmD0vh5h+s9IvO7roXyWaEULZ7Wn79e3tZN
	in9xNMNISPenr4zopohkNIgTmUXV5kVd5Naaxc/Q+RkmzEj0rhg6aIpiO2DM5+Sq
	G2MZj+FXPLVXoEliD3QywcEJ2j9O5lUCV7w2AVODnlPdN+3v//mswbc39uTttSta
	rJn5n8o5kAKnugMOZvIHvbsx1Jrj2UzDhtJwYpPzRl5Az2uRstgYvdFvudaWXdZR
	B/Ijw+Tq6rUSmi2kZ6fTvMXr/5iH+i83NRWekmbXSSfCLOD5Nrp9U1iz7SZpS5l0
	kg==
Received: (qmail 1645245 invoked from network); 13 Jan 2026 11:44:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 11:44:54 +0100
X-UD-Smtp-Session: l3s3148p1@a+yNrkJIftoujnvx
Date: Tue, 13 Jan 2026 11:44:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aWYiJbtueA8g3srn@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>

Hi Bart,

> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.

I haven't actually tested the code yet (but will do so this week). But I
already want to feed back that I approve of the general concept of
abstracting away drivers access to the struct device by something we can
then convert to SRCU in a central place.

This mail is to discuss the timeline of these series. My preferred
solution is to aim for inclusion right after 7.0-rc1 is released. That
gives me enough time to test and you some more time to address review
comments. Bold wish, but maybe we can even get dependencies into 6.19
before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
for it already?).

Does that work for you?

Happy hacking and thanks again for doing all this!

   Wolfram

