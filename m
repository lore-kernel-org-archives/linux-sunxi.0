Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C02575
	for <linux-sunxi@lists.linux.dev>; Fri,  8 Jul 2022 16:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16DE6C341C0;
	Fri,  8 Jul 2022 16:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657299520;
	bh=NwK/cMvuYLFQX7b9qiBhy4uyusgGZfGDj2CbHD2r7S8=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Gw7/rrj9P9gUq9cnWmPEW0JLJYwF5ezdWsPAu5MDCUKjB7m7IW/fJj59x5R1Mgg0e
	 /qBhutHgYZGm+ZXCKqU03yEa4m7TQYpY2cxZtBF5ZLIMwZ9u8LaJ4dty+NpAtrOWSY
	 yF8SnyJ46XEAlYP8KVqoFtjBZinPpUhzXDfT+/lDVx8opC8dIyoczLM+FXMS88YeLE
	 M9F1GRrWPq8MNQROpLwjfI7Or0U4ObNslMpd6S1fDz5s1GsYbTiFYaZ1OteWOpL9lj
	 Lefiqs/WoAVvel3NUAmhSgAIsQ+tUxDhJbW3q4M32soYSJlTzwsyyXj5SCaqT/rMFA
	 /cQ4aDzeDLRtA==
Date: Fri, 8 Jul 2022 18:58:36 +0200
From: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: wens@csie.org, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [GIT PULL] Allwinner DT fixes for 5.19
Message-ID: <YshiPKZRq6NHxPzO@kista.localdomain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

Please pull following DT binding fix for 5.19.

Best regards,
Jernej

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-fixes-for-5.19-1

for you to fetch changes up to 79471f29ec4870bc02b4fea844e86669a8a4f2a5:

  dt-bindings: display: sun4i: Fix D1 pipeline count (2022-07-04 22:41:26 +0200)

----------------------------------------------------------------
- fix binding for D1 display pipeline

----------------------------------------------------------------
Samuel Holland (1):
      dt-bindings: display: sun4i: Fix D1 pipeline count

 .../devicetree/bindings/display/allwinner,sun4i-a10-display-engine.yaml  | 1 +
 1 file changed, 1 insertion(+)
