Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBC64A38
	for <linux-sunxi@lists.linux.dev>; Thu, 14 Jul 2022 15:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5A8C34114;
	Thu, 14 Jul 2022 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657812696;
	bh=VOQW/199CRMbWh98PrMCjV6bygr6rVY+vcM2T9vyCcE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QAWNW5Vgbb53kcijWZ+O29sCVwLF5vO1Mfq0iZRvBqUvBJunyxLURHpabmYRfnDPu
	 zvYpiZMlkIkNbBxJhLYlUc37Wx4xCE/xMfwyF0xN+v4IOTAr1C/GmumdzxCstSt0MH
	 VK82FWgyYsdE7kWLOGKU0o8BSvh9tLvFH2gtp5dviIoyqFDnnqI71dLucuDS2zZPY9
	 cAiDU+h9EiD6qJchnQGZ4GiGhkphhlZqiuPlkG+Eb5FPkyEEfZzP6566KUvXtUbesA
	 Xa4e+t40r+6eCoy4WeF4JP9YKE5GMDGDV03leujXsqvhsccvVug1J5DU0QgInZX4Fd
	 MXqOxxcpStqEg==
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
Subject: Re: [GIT PULL] Allwinner config64 changes for 5.20
Date: Thu, 14 Jul 2022 17:31:23 +0200
Message-Id: <165781258677.3193274.3635616027978236662.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <YsheC0hgyJB9kPsS@kista.localdomain>
References: <YsheC0hgyJB9kPsS@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 18:40:43 +0200, Jernej Skrabec wrote:
> Please pull following config64 changes for 5.20.
> 
> Best regards,
> Jernej
> 
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 2b4b612638b8e87719f82ab7a9cda8925375eef6

       Arnd
