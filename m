Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA324A38
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 15:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FD4C341CA;
	Thu, 14 Jul 2022 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657812703;
	bh=7KHHOQxYeRXaCfeo1oGry63h2hhCRFTvLXyvFtC2FEk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=erCZob9K+oV14L5TDw5tnsPXjGpYi2Jtzxe2hx9ihMrwWzZJbF2qjU2f3e9uWdi26
	 BPyTa3fCzHLvl/22zMjiiBplkZamImaIzHN4B/6GYSl183Rgjc2SlX/KS1fXwU+js4
	 qhX2ydL0ukWaAV9CjpTh7W3qcRN1j1sE4gzEd0Q1pnNlhZTb9xTl/YHb+aLjKUo5li
	 p2TkAvhRqcuQfVw+cYml0E0pVKvRp4xYPJvRyh81RRZOzjNFjB7Jt8Lei/sd+aFgec
	 RpfERUWRnFsIXL95vf8idPGeoU8sgX3fXa47/tGCzICPUHhZFcGXg4SDAwBaXVdIIn
	 P8zOpD1+bYjEA==
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
Subject: Re: [GIT PULL] Allwinner drivers changes for 5.20
Date: Thu, 14 Jul 2022 17:31:26 +0200
Message-Id: <165781258654.3193274.11995901129474791351.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YshfPux1c2x9S7Fi@kista.localdomain>
References: <YshfPux1c2x9S7Fi@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 18:45:50 +0200, Jernej Skrabec wrote:
> Please pull following drivers changes for 5.20.
> 
> Best regards,
> Jernej
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 611f6810aac8e9b5b3eb48c0eed47e2f791af224

       Arnd
