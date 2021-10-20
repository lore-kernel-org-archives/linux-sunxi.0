Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FA52C8B
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Oct 2021 21:26:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C995610E7;
	Wed, 20 Oct 2021 21:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634765186;
	bh=+Rp2vscxbxg3jT6N4n0or5HcOx4VLKMx3dxZ67B0u+U=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4Nn9ED424rlzASOiKgZwTdkMJkiM6Jzk50IqpOOfE09VXsGYVMwnoG2sFGUz+i+Z
	 nGeJ7Plu15WlnuQXcqiDlW03NcUh03Wpjt/yb0JhgVyfw3eiD89Rxf1LC/PF8MYQMD
	 BNRYeWGVnyDAd2XoWNLJZCwkQ0ZF3BmOxEDzFQVdA/KAbk1g5YJUu6a1BLsJ42RwxT
	 VaVTIP6b1GuzouZIc2z88egLkOK41ucP1ITXGE5G8cQ3M7Ncdo81W0O3jkA5eZiuso
	 ZiKJvHg+eXlB8/L2uS8UJNXqU+uhWLG1JohMlFGFnC/d6w/ts4Sy9tLFHy7/qRcqVS
	 nnzzLJu6CZpIw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [GIT PULL] Allwinner Platform Changes for 5.16
Date: Wed, 20 Oct 2021 23:25:52 +0200
Message-Id: <163476513266.4063285.114162714174187124.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <0ceaad3e-dc26-4be6-b98f-d25e51a41b81.lettre@localhost>
References: <0ceaad3e-dc26-4be6-b98f-d25e51a41b81.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 10:06:27 +0200, Maxime Ripard wrote:
> Please pull the following changes for the next release.
> 
> Thanks!
> Maxime
> 
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 5cec64e5f97efa55a3f0a7f625263e66d09198f7

       Arnd
