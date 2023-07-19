Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A870C107AE
	for <linux-sunxi@lists.linux.dev>; Wed, 19 Jul 2023 10:07:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4B342F4;
	Wed, 19 Jul 2023 03:07:46 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 632FC3F67D;
	Wed, 19 Jul 2023 03:07:02 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yangtao Li <frank.li@vivo.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] [PATCH 6/7] bus: vexpress-config: Convert to devm_platform_ioremap_resource()
Date: Wed, 19 Jul 2023 11:06:59 +0100
Message-ID: <168976104705.3013544.1925006018431804113.b4-ty@arm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230706072042.31296-6-frank.li@vivo.com>
References: <20230706072042.31296-6-frank.li@vivo.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 06 Jul 2023 15:20:36 +0800, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
>

Applied to sudeep.holla/linux (for-next/vexpress/updates), thanks!

[6/7] bus: vexpress-config: Convert to devm_platform_ioremap_resource()
      https://git.kernel.org/sudeep.holla/c/bc0e769647d7
--
Regards,
Sudeep

