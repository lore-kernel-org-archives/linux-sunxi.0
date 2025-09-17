Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691301A9FBE
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Sep 2025 17:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758129282; cv=none; b=sG6jl2fZ+MqEh/a4KKNNPsZp2jGg6IPXqnCSmxL3Wn8l/26bEXf5LUjH9JnttMAdvbSM57DU6HpDFhFX5hOpXf0y/OLczLJZzPbniQq73xrDC+mq4l3KQOFgyYWknc6LuP3hOoe2y6bwcmiaBR5hnF5yV2ijRXeIX7/5PWr+PT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758129282; c=relaxed/simple;
	bh=JNby2W/sYXxxOCX2lFGO9FJxNer/33OdhsjWJWm+m2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nsuRX/UwEoMETwELAxN2w+xvHFZa9TTh/778SfGsx9XLh+QdRANhIZH/rDbxLO4FqNtQDITICaA3zUwpx9t9rJitnQvupWy7SEH+bwAX0e2sKWGwx666IJtmAv62cb80TLwBCJwx7evMkIOAS/5BJORpXh45VrAnfTdXg8s2u7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u25lxxnn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u25lxxnn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5ADEC4CEE7;
	Wed, 17 Sep 2025 17:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129282;
	bh=JNby2W/sYXxxOCX2lFGO9FJxNer/33OdhsjWJWm+m2k=;
	h=Date:From:To:Cc:Subject:From;
	b=u25lxxnn6Dl6f6e7pF6z6HFSUx2GcSCr+ESPvXgM7XmoU5Xxvo4gYHHDs1robpBIC
	 cC9t5cVL/Sd3eCQXFxVaj/bcZv9jG13J1/UVCSdulhgDF1ffxOfBPW8wkudS8yFshz
	 RR/iESao+lruTTyRq9rSbuHh1IoNXUDwhfL0eluVzWwCxbM7o3qLwd9QAA0sBw/mYT
	 rQqajcuSOJTZU9X6BZUEn1LzUPUtJ4/3V+/+uSV1k3CExl+NKbfr8Hf4Qv0LzRBX8A
	 39xoY0mF0z6SpYNoKATMY4CvMUoqGShnBlv4+syn9Tmn5qczBSUUXDHYR7e/OC8pTI
	 QagGJYnNYZ5ng==
Received: by wens.tw (Postfix, from userid 1000)
	id 23999606B1; Thu, 18 Sep 2025 01:14:39 +0800 (CST)
Date: Thu, 18 Sep 2025 01:14:39 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner Driver changes for 6.18
Message-ID: <aMrsfw-_v3IAiKH8@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-drivers-for-6.18

for you to fetch changes up to e6b84cc2a6fe62b4070d73f2d2d7b2544a11df87:

  soc: sunxi: sram: register regmap as syscon (2025-09-10 20:51:26 +0800)

----------------------------------------------------------------
Allwinner driver changes for 6.18

Some changes to the sram driver. One to register a syscon explicitly.
Another to add a new driver entry for the A523, which has two Ethernet
controllers, and thus has two RGMII clock delay control registers.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      soc: sunxi: sram: add entry for a523
      soc: sunxi: sram: register regmap as syscon

 drivers/soc/sunxi/sunxi_sram.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
