Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9320930C361
	for <linux-sunxi@lists.linux.dev>; Wed, 25 Mar 2026 14:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448978; cv=none; b=KgnRM1XdN2DNID9ftAl4a8rLh6OXXvanideCqLgXXFAVOVF7zOMh6HFEoqCC5muj7CA/StirrNY817R7z88pwoE73/Ee5PaADWEcGPnk8wBHArWS2oLd3SHW5fij3/5E9/TRmW0ac6yDWW1HGwTkzUnTPW7eAECoM0D9ZSqtdao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448978; c=relaxed/simple;
	bh=OoVuZ8BE1W6GNEWqnyLhtVtF4KzJ9GeXih75Mmff+Fk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BwE3F4E0//TbZtFlZbBPkMJhaNbXfQSkHnICxo52DQdecZhQIuAmE+8h9ZdDn6T/5oiFF2aBGzXePAtejkHcb3+3mTulBYecv158DwXf9ZOv6qhqHottBakcRc/2JvNa5fPSMXknNkvf1yVTSG808fpnyLS9qdfSdGBFgqPQ4Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wvY+FFqz; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wvY+FFqz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4B6E54E427EE;
	Wed, 25 Mar 2026 14:29:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D46F6601E2;
	Wed, 25 Mar 2026 14:29:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4554710451A66;
	Wed, 25 Mar 2026 15:29:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774448972; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=EIzstPiLooAoyT1/YZYU3N60HynNZYjCHkfUaSvDG8Q=;
	b=wvY+FFqzTiSwisTGKrRXWR0jYFs+09psrFJeQhfguL6DicvtQD/tIi+253WAOY/Jg71+Xx
	/kTLUL+DNTj3+l1c56KNVVd5mACd370FJXIgAxZglP72fyTaCxYqT1JxwWNZ2trOrbm0/X
	byrViwrED4FQDvFjbuE2OZtEE4s6O/b1CrP7VxwkzRVeI4aAqm0cG2OXBxxyaz/WSDC7sG
	pl/UO9KvapCs6O7Dh3N296+OzcDLA4Wy3dqNaqDoNXI4ujdu0z1jwqGqqXMI4uWn6kXitP
	o7CfPF/jMB8507LuFKEAP8332aXh+Qm3G3w/SN99sTOpL1cMvROcpi7r2JauFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>, Maxime Ripard <mripard@kernel.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260317142437.580204-1-richard.genoud@bootlin.com>
References: <20260317142437.580204-1-richard.genoud@bootlin.com>
Subject: Re: [PATCH v3 0/9] mtd: rawnand: sunxi: Fixes user data length for
 H6
Message-Id: <177444896601.837464.10999633870241731377.b4-ty@bootlin.com>
Date: Wed, 25 Mar 2026 15:29:26 +0100
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 17 Mar 2026 15:24:28 +0100, Richard Genoud wrote:
> This series introduces the correct usage of user data length for
> H6/H616.
> If the older SoCs must use a fixed value of 4 user data bytes for each
> ECC step, the H6 can have a different value for each step.
> 
> In the first round, the behavior was kept as the one used by A10.
> But we have multiple choices:
> - do like A10 like before (and not use all OOB)
> - do like the vendor kernel (different from A10, but not using all OOB)
> - use the whole OOB for user data bytes
> 
> [...]

Applied to nand/next, thanks!

[1/9] mtd: rawnand: sunxi: sunxi_nand_ooblayout_free code clarification
      commit: 87f9c59f896fd46d45be76d8a8286a6916ce1f1a
[2/9] mtd: rawnand: sunxi: fix sunxi_nfc_hw_ecc_read_extra_oob
      commit: 848c13996c55fe4ea6bf5acc3ce6c8c5c944b5f6
[3/9] mtd: rawnand: sunxi: do not count BBM bytes twice
      commit: 8fa72836be11ea70cbfa43f7f2253fa57ccc6ecd
[4/9] mtd: rawnand: sunxi: replace hard coded value by a define - take2
      commit: e3fd963da4c7469757d4f7741157fc5e23da47ed
[5/9] mtd: rawnand: sunxi: make the code more self-explanatory
      commit: 548f87ed47479e08203bc576cb5020f537e49bce
[6/9] mtd: rawnand: sunxi: remove dead code
      commit: 2781542caf681ce52f213152104fb7669263651c
[7/9] mtd: rawnand: sunxi: change error prone variable name
      commit: a1c967f5d6a568dd24583917774e0178b8e39221
[8/9] mtd: rawnand: sunxi: fix typos in comments
      commit: a22f40d9eb1ef587a8201fde3f004173fd8b5e8e
[9/9] mtd: rawnand: sunxi: introduce maximize variable user data length
      commit: 54dcd6aa69db541529a083b31f106ef7d147fea1

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

