Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B053AA1A0;
	Tue, 24 Feb 2026 17:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955875; cv=none; b=Uor3LjAI0AHE7/FB4Da5JlQ4DkKIlPGdP7iMaaA6K6d0QaUUIDDZopa6gzMwgaQi0JqVSR7ojyXIPDBTQEOZKyiyJdcQK4RikzizgkD3btKcw36ToIirA/JoRieBd9auUUn/u+FyO6bgSEGFF2SzqGh6DAwPSsFWq3WL2hK9/DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955875; c=relaxed/simple;
	bh=SQb91GNf6kVtqmOCOt3loCbr4Ww0TH1GIwC6YpIa3uc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ljLbdsH88mrh0IabiW+//MPI8nPXdo6SBpn+EGZ9otEufJSKX6M9624Zw6EHr2sHHA1Q3MkTSbNIzTivncgm+1Pq027qknVzza/FJBVvZ33IuKHwPcX3esdBS5q0/+Ia6gAF2EEguJaWFDEYRf6qs45tdaGkNAWixMfPXX2x9MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FlzYna74; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FlzYna74"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D882AC19422;
	Tue, 24 Feb 2026 17:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771955874;
	bh=SQb91GNf6kVtqmOCOt3loCbr4Ww0TH1GIwC6YpIa3uc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FlzYna74ue06WvicglgW5ofZKmiQcZYJBYKZPX8MGqAMXDGHaYh8mKmSzR39lAyf+
	 cc+jWS36ewuLRiEjD9X+ss8iEUip74NsxIZ7HsG6AEoMVgWSy30nIQZXoWQOkOSFWF
	 kDA4WkOl70NES7HOrUg4FvIkH8OEPhLSVh4+1pURK53zh8I2S75RccB+wSWBcBP33u
	 CaFSdxrtliwgHJEye52dr0VhlRb7VgeQ0QWPPMfM8n2jx0VELRqvp3MOl5/tuo76NU
	 VkAlQsvBd+LQlzi7VB5ESr/h+N+p/IcKukRVXMIJWAsD2J0K7HQ5EAcvUlhV8yyQpQ
	 wmVQNodQ9fWdQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org, 
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, neil.armstrong@linaro.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260217014801.60760-1-ethantidmore06@gmail.com>
References: <20260217014801.60760-1-ethantidmore06@gmail.com>
Subject: Re: [PATCH] drm/sun4i: backend: fix error pointer dereference
Message-Id: <177195587163.131169.15955848927842554754.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 01:57:51 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 16 Feb 2026 19:48:01 -0600, Ethan Tidmore wrote:
> The function drm_atomic_get_plane_state() can return an error pointer
> and is not checked for it. Add error pointer check.
> 
> Detected by Smatch:
> drivers/gpu/drm/sun4i/sun4i_backend.c:496 sun4i_backend_atomic_check() error:
> 'plane_state' dereferencing possible ERR_PTR()
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: backend: fix error pointer dereference
      commit: 06277983eca4a31d3c2114fa33d99a6e82484b11

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

