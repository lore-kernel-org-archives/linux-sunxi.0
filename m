Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD75F272813;
	Wed, 14 Jan 2026 14:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399293; cv=none; b=HYXO1gIHUZpAya5RzzQFZAXkvqlaTdWAiU3+XzWoVUdf3PonYlX36IKAO2N93AkGOn3CK35yjS/sw1JLslTldMQr8jA7qAV5S1PmHyag2b1K/BmpCpznLBB45jPiCOzw9dEmvmdKP8+K1DcAnF7VnW/T8oFkF3he1xgNXft4KrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399293; c=relaxed/simple;
	bh=+PlGFhehw9pvT1fTeNTIF8koULdH0BUOJ+fDH8yqZwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FotBLnt+0L3Kv0Yzna8HaIxaAid7l1av9ZMoMm5Qk+JtVtgDk10nkuXywR+M4crvCoSHbJn8YrcTYAjRTZdc1vZSN+ZDOFfmCz68zdVySikgbcoK/6A3ypTajtZ2xjCHMPjSBVLO7w1WnCI+/hU3PwOy7LgmNwvj965dXMB+LC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ugq2Q7NM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ugq2Q7NM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF47CC19422;
	Wed, 14 Jan 2026 14:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399293;
	bh=+PlGFhehw9pvT1fTeNTIF8koULdH0BUOJ+fDH8yqZwY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ugq2Q7NMaYTXFV1ThT3q7e3DBYSOPt5A5bWniBbCjgJXaA05WP/krfSl5A9BbkAGX
	 BTZwYp7zx0Zrm/Z7kw76XROcjIZVCBX/4KwGQ/P6kqE2GSxSiALKqjwCyC+aSXSFr4
	 0nX7SOjhtqgmL611RkqV7D+ScQM8xafLX89pziD86o6Ax6/LuWtQbeh82PZ6mkJLh3
	 Tz3v8cz/PVjXFsztQv35sTwE8Stzg20MW66DmT4SJMbD8GghbNumwbTOal/Z3+B1p0
	 2wjDQn3sWPuqdC2Guy9TeUUank2Rg16llMwtHneJzS7ZifJosxHckmcZgdNXNP2lKO
	 VOkPUF6U1iVfw==
From: Vinod Koul <vkoul@kernel.org>
To: linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Michal Hocko <mhocko@suse.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
In-Reply-To: <20251105152023.259813-1-marco.crivellari@suse.com>
References: <20251105152023.259813-1-marco.crivellari@suse.com>
Subject: Re: [PATCH] phy: sun4i-usb: replace use of system_wq with
 system_percpu_wq
Message-Id: <176839928954.937923.15095865192573263958.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 19:31:29 +0530
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 05 Nov 2025 16:20:23 +0100, Marco Crivellari wrote:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> 
> This lack of consistency cannot be addressed without refactoring the API.
> 
> [...]

Applied, thanks!

[1/1] phy: sun4i-usb: replace use of system_wq with system_percpu_wq
      commit: 877686f9f42b58b04e4e25d07034bc95cadc20f3

Best regards,
-- 
~Vinod


