Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A6A4A38
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 15:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6652C341CA;
	Thu, 14 Jul 2022 15:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657812698;
	bh=TEv+s5S9J4Lq2+UgfY37oaJ4Fw6XdDd2RvLM3aDVP7Q=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=njtcOqglx+Ns/isiAjY5ronfHVI5yP3JfpufLC7K3/1hp8VfL2zv4WnP/PH0inYJG
	 dk/CjarQQH7Qfj8lEPkqmKrMr8gQeAs2yzdnN9VfDS/8iez94nXndW29g19yxP5JCr
	 Ajqe81WvG78j6PHNCPjR7K+FKosiPoqQWYvE/F1ojcf4zcJkPyU0T93I7E/4KSSS7O
	 oXeigUpSZ5gSo+S3cSmxjC9kEIj6JscKqPaPA2cfsxFl/12mGMbF0KeUATnpG7jh5u
	 /0ZEOaitr1qxcQd1imettznVp+9C5/SMIG3waZsspO51D3NHU7GmY1MRQdDIURUA37
	 6YLhBHEk931tA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Jernej Skrabec <jernej@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	wens@csie.org,
	samuel@sholland.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [GIT PULL] Allwinner device tree changes for 5.20
Date: Thu, 14 Jul 2022 17:31:24 +0200
Message-Id: <165781258608.3193274.2895296041886377814.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <Ysh8qRH0Q5Xv9Qhf@kista.localdomain>
References: <Ysh8qRH0Q5Xv9Qhf@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 20:51:21 +0200, Jernej Skrabec wrote:
> Please pull follwing device tree changes for 5.20. Note that last commit
> aab941b8c3cf ("arm64: dts: allwinner: pinephone: Enable internal HMIC
> bias") relies on property for which dt bindings change is going through
> asoc tree. I hope that's not a problem.
> 
> Best regards,
> Jernej
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 3a1149e59a942bae46c03cf2f01c6e462e7a7b80

       Arnd
