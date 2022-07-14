Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113EE4A38
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 15:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080AFC34114;
	Thu, 14 Jul 2022 15:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657812700;
	bh=viAviH3WWoXsoqaK1SPUxEtwoxJNsiQGCJlCbOT4kd4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T40nRB1BQCoGZWE2Z0mXJ5lQV0gzktody39/NSKK2MrykoeeAaqShnXLp7mAWI9oa
	 KL4yMl2o3jyDkGZr8rDvostIDhGE9TaYxlaQmC/FrjszdQuJuMIKRynrnNMr6//2rX
	 w7d2g4LsUaw+qbWasIkoAy76imviot46ysGzcXrYOQlZcUaRoWsNrXDninbvtv1EIk
	 xs+j7fp3MDQhysOnQHGGuGsCZPtKrjOTVu62YU0fv7ZGsjSh9umTfgrPpZVqKif4pH
	 QzQVhvV+l+M9p4CTuVgSSrXjqR1ox7lfOCdhPmPlGMVofILY1ye2rjEveMkqzeVaWN
	 WSLxK4IjyZ30A==
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
Subject: Re: [GIT PULL] Allwinner device tree changes for 5.20, part 2
Date: Thu, 14 Jul 2022 17:31:25 +0200
Message-Id: <165781258630.3193274.6943025421573312789.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YsnF9cm/qniIOklj@kista.localdomain>
References: <YsnF9cm/qniIOklj@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 9 Jul 2022 20:16:21 +0200, Jernej Skrabec wrote:
> Please pull following DT changes for 5.20. This was almost ready to be
> sent in first PR, but it needed one small adjustment, so I'm sending
> this as second pull request.
> 
> Best regards,
> Jernej
> 
> The following changes since commit aab941b8c3cfb020baf2218e9e39706e05bf4877:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8f8a7775b66e61a4be218313bf5111a7622169fe

       Arnd
