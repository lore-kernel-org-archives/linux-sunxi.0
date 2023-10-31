Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A9A1DDD4;
	Tue, 31 Oct 2023 16:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MI4z/2Kz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C7FC433C9;
	Tue, 31 Oct 2023 16:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698770920;
	bh=CAcs4O/o+PBiLY0PT/kHw+LK8BKStaQ0lNJbZ4whT7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MI4z/2KzWWgmobRF9N6WdI+jEw6W/ozqZgoJ9OYn0hFdd9MaQARXYB4WCEtn5Y36i
	 0l3A/4gF6W9mo7flMDvUsRvrsCt2ljWfYJzt2mqYlcy4iDUtYk0WTWJ36PvxeAn/XC
	 ScFQZrCXQxqSC6jeqVucGQbJUfHapfpQOvnB2e1vHZdTwPbXsprFrgoOA2xfrhnFgJ
	 MCOVOEzB6MfNNt+XNoqarH1KLJsAUn3pKIOD969mmKff92LYFq1ZPn3CTjgcCgiI7b
	 +P3BeZ9NWm9Hj6teit8tcw3Tb4LF4kdx45jfpclNrc5Utm9eDVSaoCBuV0/PUBFS27
	 gTmpXUI7IxDqA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Oct 2023 17:48:15 +0100
Subject: [PATCH RFC v3 02/37] drm/connector: hdmi: Create a custom state
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231031-kms-hdmi-connector-state-v3-2-328b0fae43a7@kernel.org>
References: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
In-Reply-To: <20231031-kms-hdmi-connector-state-v3-0-328b0fae43a7@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Emma Anholt <emma@anholt.net>, 
 Jonathan Corbet <corbet@lwn.net>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4061; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CAcs4O/o+PBiLY0PT/kHw+LK8BKStaQ0lNJbZ4whT7A=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDKmO+ndddjOZ2Z1qr5pnvy1qTu3+wLUTtge9eeny9sUvH
 vWktSsqOkpZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCRFXsZGU4Kmx9g/Ol579mF
 CPFz+xexHV+Xntv+2Fbu1r3An9UXTkxhZPj/rDC38/Ejrsp9wfwn9ojP/pLHwmG5w3SWXJjIpem
 /WLgB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The next features we will need to share across drivers will need to
store some parameters for drivers to use, such as the selected output
format.

Let's create a new connector state dedicated to HDMI controllers, that
will eventually store everything we need.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 35 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  4 ++++
 include/drm/drm_connector.h               |  3 +++
 3 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..29cb64e9cf28 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -556,6 +556,22 @@ void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_reset);
 
+/**
+ * __drm_atomic_helper_connector_hdmi_reset() - Initializes all HDMI @drm_connector_state resources
+ * @connector: DRM connector
+ * @new_state: connector state to reset
+ *
+ * Initializes all HDMI resources from a @drm_connector_state without
+ * actually allocating it. This is useful for HDMI drivers, in
+ * combination with __drm_atomic_helper_connector_reset() or
+ * drm_atomic_helper_connector_reset().
+ */
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_state)
+{
+}
+EXPORT_SYMBOL(__drm_atomic_helper_connector_hdmi_reset);
+
 /**
  * drm_atomic_helper_connector_tv_check - Validate an analog TV connector state
  * @connector: DRM Connector
@@ -605,6 +621,25 @@ int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_tv_check);
 
+/**
+ * drm_atomic_helper_connector_hdmi_check() - Helper to check HDMI connector atomic state
+ * @connector: DRM Connector
+ * @state: the DRM State object
+ *
+ * Provides a default connector state check handler for HDMI connectors.
+ * Checks that a desired connector update is valid, and updates various
+ * fields of derived state.
+ *
+ * RETURNS:
+ * Zero on success, or an errno code otherwise.
+ */
+int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
+					   struct drm_atomic_state *state)
+{
+	return 0;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_check);
+
 /**
  * __drm_atomic_helper_connector_duplicate_state - copy atomic connector state
  * @connector: connector object
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index b9740edb2658..d59d2b3aef9a 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -71,7 +71,11 @@ void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
+void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
+					      struct drm_connector_state *new_state);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
+int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
+					   struct drm_atomic_state *state);
 int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_state *state);
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c86cd363d652..5961f2ad48b1 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1022,6 +1022,9 @@ struct drm_connector_state {
 	 * DRM blob property for HDR output metadata
 	 */
 	struct drm_property_blob *hdr_output_metadata;
+
+	struct {
+	} hdmi;
 };
 
 /**

-- 
2.41.0

