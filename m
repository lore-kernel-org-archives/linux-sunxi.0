Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9377A29CA
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Oct 2021 14:50:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 821A06137C;
	Wed, 20 Oct 2021 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741446;
	bh=yHqHrbbK5M2waw5Bwrqa8vjhfMskej1hsUVj87nxyfU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kNKU6mWzet2J+QMfdMrvoONhipvCl9CoOz8Ml5YYJBat0d70hxKfBwTb7D5sdKLQs
	 szp4ys7Dcx/mEOUFmphHehCx61/NLiyyJMUDMPKcr8ViCW4AIq+sYhWXoEstQCxDmh
	 h+Fb8sX1bNfeWJgdSyMO7LnkquPW1BhKSvt+kpUdZq2ZGvVw86oxXXaf65XhU1HNjc
	 6wuQDNSd03DZVroizb1LH+/YvIBm43UWS0lIKVXd4fViXCX/5/6tM6C9Is3r3wwUzA
	 2ugzjRL/GAUAsygVwK8smfXdepkkoydHtFdbIHvdrkDcKy1d/IG/JEF3RORVFyiReX
	 dBySiV0MXHbRg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner Device Tree Changes for 5.16
Date: Wed, 20 Oct 2021 16:50:16 +0200
Message-Id: <163474139809.4099414.12404569120453905287.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5cad5ac6-187d-4d36-9437-5821c6e8242d.lettre@localhost>
References: <5cad5ac6-187d-4d36-9437-5821c6e8242d.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 10:00:48 +0200, Maxime Ripard wrote:
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

Merged into arm/dt, thanks!

merge commit: b4ebc083a3e0172006c53f1689926ede77bbbf7e

       Arnd
