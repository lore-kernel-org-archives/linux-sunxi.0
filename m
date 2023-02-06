Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E043C2C
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Feb 2023 12:02:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id ECA3DCA083
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Feb 2023 11:55:36 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9AC16E0003;
	Mon,  6 Feb 2023 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675684528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t6opdrNXEFTZP/9r8sTzfu5r14DTeRX8UGZDZ1N132Q=;
	b=dQM39NG9tdBzdOSMBVXvNAhdkiNm0ThDtqGF20nsPA0ShGtP5SbQHprPSujOQxa5VyQVvA
	d/yc9GAL2Y0/MCCOhM3csRA+Ahvd8zGnjw71h3a0V9+3gVPl/c/5W0qrWACS4guNCYk4BC
	2N/bKMwwTmvfJuoi2r9urlC8qDCDOhOeClzjHEmQ9oVh5FEg1qzhmtfHSER9qQ5j8yg3/5
	j69rqQF1AlWiv2CPyKVpeC6jrc8RB1khXYxt4uKjEedDkR9doMcll/PIeqBf0gpweVXWwV
	n56mrVFzi3QMcQPoqLZ0++9pAqlimqD+VzIyxjGsezMLzYAf9w6+7zvK/sPgDA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Samuel Holland <samuel@sholland.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] mtd: rawnand: sunxi: Update OOB layout to match hardware
Date: Mon,  6 Feb 2023 12:55:26 +0100
Message-Id: <20230206115526.560886-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230204143520.9682-2-samuel@sholland.org>
References: 
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3998a4611e8be2e9b5833e7aae29619ea0305437'
Content-Transfer-Encoding: 8bit

On Sat, 2023-02-04 at 14:35:18 UTC, Samuel Holland wrote:
> When using the hardware ECC engine, the OOB data is made available in
> the NFC_REG_USER_DATA registers, as one 32-bit word per ECC step. Any
> additional bytes are only accessible through raw reads and software
> descrambling. For efficiency, and to match the vendor driver, ignore
> these extra bytes when using hardware ECC.
> 
> Note that until commit 34569d869532 ("mtd: rawnand: sunxi: Fix the size
> of the last OOB region"), this extra free area was reported with length
> zero, so this is not a functional change for any stable kernel user.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
