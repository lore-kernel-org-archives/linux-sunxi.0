Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C83C70
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jun 2021 19:33:25 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id C2210C3E36
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Jun 2021 18:59:47 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E23F51BF205;
	Fri, 11 Jun 2021 18:59:37 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zhen Lei <thunder.leizhen@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	Maxime Ripard <mripard@kernel.org>,
	"Chen-Yu Tsai" <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-sunxi <linux-sunxi@lists.linux.dev>
Subject: Re: [PATCH 1/1] mtd: rawnand: atmel: remove unnecessary oom message
Date: Fri, 11 Jun 2021 20:59:37 +0200
Message-Id: <20210611185937.224994-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210610020958.15023-1-thunder.leizhen@huawei.com>
References: 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'185675232072b38bafc2f6cc7e2904aa3d477620'
Content-Transfer-Encoding: 8bit

On Thu, 2021-06-10 at 02:09:58 UTC, Zhen Lei wrote:
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
> 
> Remove it can help us save a bit of memory.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel
