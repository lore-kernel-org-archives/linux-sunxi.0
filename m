Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FB12066CC;
	Sat, 22 Feb 2025 13:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740230742; cv=none; b=kpg9ZC36pc3+AOmJBtEcAztl9c5o8iw/M0d6yNRh72aguiInOuzglf02wEMwVNmoxZmYjaopyI1OkuQV+y6ZDzHx7yB7uq2WJmwFmVGpiyx+JT0fVseCGkZAZwocQpR/hKDih5mIFaHN2nGCQxW/MZB6S9YZM2gv90Nxdlmb968=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740230742; c=relaxed/simple;
	bh=do/D+RAXNRWDz0Vhg7IqTT/k8b0fOUJ6GPguABcgOXU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PZnCile4zi85AkWR3QzIUvBuiNlGKnaOM9yYfWLtnw37Hs59womPDFugDfG8U+G5lD1VnVWOyC98Pdk/3xNVFDoHIzeV2dvD5xfH2qifF4iyu0a499xOwvqcZqmy8gMY7wFrEzXtl1miC/lST592/k0HUuhC/CChPVpHpDhqysY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98F2C4AF09;
	Sat, 22 Feb 2025 13:25:41 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 1A0935FB58;
	Sat, 22 Feb 2025 21:25:39 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: linux-sunxi@lists.linux.dev, Chris Morgan <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, samuel@sholland.org, 
 jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
In-Reply-To: <20241018160617.157083-1-macroalpha82@gmail.com>
References: <20241018160617.157083-1-macroalpha82@gmail.com>
Subject: Re: (subset) [PATCH 0/4] RG35XX Add Additional Hardware Support
Message-Id: <174023073910.2739576.16168907043027219468.b4-ty@csie.org>
Date: Sat, 22 Feb 2025 21:25:39 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Fri, 18 Oct 2024 11:06:13 -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for MMC2 and the second LED on the RG35XX series.
> Additionally, enable the CPUSLDO regulator to be "always on" to resolve
> bootloader issues during reboot, and add support for the USB host port
> on the RG35XX-H.
> 
> [...]

Applied to dt-for-6.15 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[4/4] arm64: dts: allwinner: h700: Add USB Host for RG35XX-H
      commit: 81009e49ddc8a1e27d414dbf9ff1837d1753b257

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>

