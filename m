Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987C02C80
	for <linux-sunxi@lists.linux.dev>; Wed, 20 Oct 2021 16:00:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E7E361373;
	Wed, 20 Oct 2021 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634745644;
	bh=9+oQ5QtKkswCP0/5OyFH3wR7AwYAn4bsNIz73pLh23o=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cXxDLOTM8tatKT7LiwMzFLdwZ6KRHpsqlQWiFqV5CVHEnbRTdp5bEFwBm3910+JVz
	 hEzPe9nqudmgldxEmVGTcdUcqjYAR1SPJv5iSGlpUeyiXr5bgcmu9KJN36h8SXACpx
	 nFJ8Aj9YMnTfNFVhZkRLGuoIkXu7PDv0p3d+G91mvorfVY7xt9pTeAlfKuU0gye314
	 XoCqY557FdiX6CDThN0pFJ4YJG7JPef7FA1VRGuCNIqZAXGk6THSd6RuM7+VsbZgk6
	 dlo3L6cfRq3wCyECOAZPc9ou2OXGsvFOdyis2HtQVwclsdlb9M3kLBFzYfe5aFxTKL
	 Ho5CyjIaQ63mA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-sunxi@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@siol.net>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Allwinner Drivers Changes for 5.16
Date: Wed, 20 Oct 2021 18:00:32 +0200
Message-Id: <163474562261.2274953.5755457766453207269.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <ad0aa469-9e1b-4bb6-a116-92648ed774fa.lettre@localhost>
References: <ad0aa469-9e1b-4bb6-a116-92648ed774fa.lettre@localhost>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 10:02:01 +0200, Maxime Ripard wrote:
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

Merged into arm/drivers, thanks!

merge commit: 409d8a9c1dbe504a28b5e5c2f7ecdb8be9f9da45

       Arnd
