Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8057C
	for <linux-sunxi@lists.linux.dev>; Mon, 28 Feb 2022 15:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F7CC340E7;
	Mon, 28 Feb 2022 15:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061408;
	bh=FcP/eX2T96zmcYVJS+yPtFTHe7TWiDVTwVHU1TJioU4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SjUa0mHQLQdlrwp3AVs9Ppg9NErgc/NJTeSINp47FRvx+tqzEICLto5sRjlHSXfw7
	 85Rar0Cyt2Dpi2DMLA4DHuoGLF7lWvMY/fuYE81SUBDFK609bEcf6BYp/6PsOtePAb
	 CqRyL38NbscrGB23iv06XgPkuQ20/zEMm4qR6CIjPfKmTa5mTVa7TzxTa+/OdosIn+
	 4U9xouzAauj7RWoEgFKmyZA8o9ABai85ANZGRjIKT3j/a33ntoHRl/LINqVjgyV0Bu
	 9mH8QdqRSmA/YgAii0RvDzK47xzDXt1mP9VZitOCldRK0FC+Ux3u+ADTmA0f5fi1s5
	 DVXMCL2d+I+zw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Jernej Skrabec <jernej@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	wens@csie.org,
	mripard@kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	samuel@sholland.org
Subject: Re: [GIT PULL] Allwinner DT changes for 5.18
Date: Mon, 28 Feb 2022 16:16:29 +0100
Message-Id: <164606117005.3364867.891182111712277144.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YhgMJ0AqaHopzaW3@kista.localdomain>
References: <YhgMJ0AqaHopzaW3@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 24 Feb 2022 23:52:23 +0100, Jernej Skrabec wrote:
> Please pull following changes for next release.
> 
> Best regards,
> Jernej
> 
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: ceaf23fe3f23b3e5a31efa4716b315ad11544e5b

       Arnd
