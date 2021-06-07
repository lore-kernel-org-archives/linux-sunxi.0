Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778542F80
	for <linux-sunxi@lists.linux.dev>; Mon,  7 Jun 2021 11:36:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D028B61105;
	Mon,  7 Jun 2021 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623065811;
	bh=c2Qi/RwHy+r+UZ6YvWxKLfFKoK0T162ZDDxeg9kewIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TROfEnugC4Mv3l6B7v0lZWq4GZliyMxg7ylZ9k/XaO9f8gv2ZyA+8065CnDm2HAv3
	 9QCja98C2GL7hb7K9lZJuMReFxFLiXc+irdEWeLo8jLSAFp5bQRIJFoQtnetpMh0bt
	 Dx14XVMNBcDq+iTnolM0cBKROLaSaNJydQIYfxPg/FarPAl1fXpX0XcLEldt0RIZmU
	 C8n+xyV23OKp/TfizO/dIzt/L1RO4pRGnoYzLD24AlLVdAbJ0Nl51HaVGavTaHGLMv
	 1gZIyfQHcgIEjbflDL2e1ShtzfMD/mWowrTiSs8yfpMCpLKnPqL74N1jTwQpRNNF6S
	 qUrgYRpO1aKCQ==
Date: Mon, 7 Jun 2021 17:06:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zou Wei <zou_wei@huawei.com>
Cc: mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] dmaengine: sun4i: Use list_move_tail instead of
 list_del/list_add_tail
Message-ID: <YL4Ez+DWRF15MKgI@vkoul-mobl>
References: <1623036035-30614-1-git-send-email-zou_wei@huawei.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623036035-30614-1-git-send-email-zou_wei@huawei.com>

On 07-06-21, 11:20, Zou Wei wrote:
> Using list_move_tail() instead of list_del() + list_add_tail().

Applied, thanks

-- 
~Vinod
