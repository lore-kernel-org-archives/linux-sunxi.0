Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C14C2FAE
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Aug 2021 12:59:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3A976102A;
	Wed, 18 Aug 2021 12:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629291591;
	bh=Vhr4o/wfpkCSnBGcd+cyLheEmqwjWi3OvwVxuNu47/w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=upIRv1hpsxfBLnbWKZQzqICL6ejEyjVx8GSVE96DnCxN+0vlnIupa0cootvKVLTix
	 LAPcpdP8zILBvzyk9LjyxhF1EuAH7dmWqEqhuvIU9Yy7mKavR4MddsCkjmBMKTNrBC
	 bxL3uhkH1xPNKdCBGOeDj80agc2tL5FBUuViICI7gudJLUqzMXl381EKF/zGOP/rev
	 SdjQ+bSyXGI6++xdfu2FCy6vgBi1Ndkfi9uOpwgOcplHLDlo82tVEd2JtGSnK8k/pS
	 L3xusTxumW01b7ox8KU9vcMQNInflr6YYi1j9LdwdfjtLBrq26RF2jiPJkyEBQjyX6
	 cV5DEYtw4bhfg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 5.15
Date: Wed, 18 Aug 2021 14:59:26 +0200
Message-Id: <162929137195.372162.12135615382649684003.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <39cd7be5-a9a7-42b6-bc29-f895b9a3448a.lettre@localhost>
References: <39cd7be5-a9a7-42b6-bc29-f895b9a3448a.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 17 Aug 2021 10:35:04 +0200, Maxime Ripard wrote:
> It's been a fairly quiet merge window for us, but please pull the
> following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 4b2784473108ffaac1ab78a2de928931693e47fe

       Arnd
