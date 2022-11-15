Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B6528ED
	for <linux-sunxi@lists.linux.dev>; Tue, 15 Nov 2022 09:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3898FC433D7;
	Tue, 15 Nov 2022 09:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668506211;
	bh=OxSSLC5s3zYlfc0BwFA+5cZFGoeym1E5oa0EER2/Ll8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rBr+5SQ/iwmYPVxhEa/zE/oLpD5/FLlqHcfk2v+v12T8o6+JRAzpGQQ4/RNGMmOxc
	 I9O0uBKbH076JhfhBrQhXP9PFDcye8eYTIB0OTRbR8CuKE9AG4e0E8u+Qkb9GuHvBA
	 1DNaSdZy8VVUFYIcu3hmqEWl6AmJCLEmC9KegNa+YP4UeUduSlsujmRnCRnvb4W17C
	 kQbTBJZC/uPJbeVzeAQK0oZKOP0xLTnIml/bEDU3hI5hTn6EPtAJlhyU20GOmPg/s9
	 13ZLxu7k+ei6DKhYi/8XV7/sCvJvBg6SqgD/C2r4iKoPvyf31XcVG1M2iKZd3vxIL8
	 EwcMmovNEeW5A==
From: Mark Brown <broonie@kernel.org>
To: fengzheng923@gmail.com, ye.xingchen@zte.com.cn
Cc: chi.minghao@zte.com.cn, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com
In-Reply-To: <202211111641514826535@zte.com.cn>
References: <202211111641514826535@zte.com.cn>
Subject: Re: [PATCH] ASoC: sunxi: use devm_platform_get_and_ioremap_resource()
Message-Id: <166850620892.114707.3764390592141990223.b4-ty@kernel.org>
Date: Tue, 15 Nov 2022 09:56:48 +0000
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31

On Fri, 11 Nov 2022 16:41:51 +0800 (CST), ye.xingchen@zte.com.cn wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: sunxi: use devm_platform_get_and_ioremap_resource()
      commit: f8fd5f4813b6d8bdd003ffe164e98bfa01b1c830

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
