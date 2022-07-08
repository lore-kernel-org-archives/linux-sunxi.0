Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589B320E
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 16:40:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30BCC341C0;
	Fri,  8 Jul 2022 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657298447;
	bh=bMr4UlDyzQyfV4TSFUR109tk/tUvUuwJwppGmASzYQU=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=pGEEUoQIxTlf+idr0RPfwJMUGvzGl67V7o8sBi+Xq/YvpzR4NeoC+DeBGVq57/CSV
	 GkRUB7cFGzfCXl4POyziGa0fFm84uOyIEew8VKfQ9z+av4cuGXnhOodm+rwieKTejK
	 Tz61+Qvxur4JSVeI637JCi/4thQlxXktyM/2b8+1YoyQnBNLmPYTlzcWwjuahE/Atj
	 QTvzeICVZ5YHucbwtGwy+6Wr0JCHkyN8pULwlgqib6vbTJLsfv7JywZMWQ2WLKOFtU
	 SxADRnHzBRxkX9GzdIrUmqehmNifGmLbKRHy5EvMHQRVFjGL8v1MazVr+QOyZNfKlH
	 D85sf2gUgWYTw==
Date: Fri, 8 Jul 2022 18:40:43 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner config64 changes for 5.20
Message-ID: <YsheC0hgyJB9kPsS@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following config64 changes for 5.20.

Best regards,
Jernej

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-config64-for-5.20-1

for you to fetch changes up to 900bd8cb85277dd23713f92db72dedd59b62d9fd:

  arm64: defconfig: Enable Allwinner built in CODECs (2022-07-04 22:25:02 +0200)

----------------------------------------------------------------
- enable Allwinner analogue audio codecs

----------------------------------------------------------------
Mark Brown (1):
      arm64: defconfig: Enable Allwinner built in CODECs

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
